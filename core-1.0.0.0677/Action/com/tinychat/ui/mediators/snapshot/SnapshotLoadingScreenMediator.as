package com.tinychat.ui.mediators.snapshot
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.services.snapshot.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import com.tinychat.ui.components.snapshot.*;
    import com.tinychat.ui.mediators.screensequence.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class SnapshotLoadingScreenMediator extends SequencedScreenMediator
    {
        public var view:SnapshotLoadingScreen;
        public var snapshotFactory:SnapshotFactory;
        public var snapshotService:UploadSnapshotService;
        public var injector:IInjector;
        public var postChat:PostGlobalNotice;
        public var broadcastCanvas:RoomBroadcastCanvas;
        private var bitmap:Bitmap;

        public function SnapshotLoadingScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Creating snapshot...";
            this.view.loadingMessage = "Creating and uploading snapshot...";
            this.view.failureMessage = "Unable to upload screenhshot.";
            this.view.confirmLabel = "Try again";
            this.view.cancelLabel = "Cancel";
            this.snapshotService.success.add(this.snapshotServiceSuccessHandler);
            this.snapshotService.failure.add(this.snapshotServiceFailureHandler);
            this.view.confirmed.add(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            this.createSnapshot();
            return;
        }// end function

        override public function onRemove() : void
        {
            this.snapshotService.success.remove(this.snapshotServiceSuccessHandler);
            this.snapshotService.failure.remove(this.snapshotServiceFailureHandler);
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.canceled.remove(this.canceledHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.createSnapshot();
            return;
        }// end function

        private function canceledHandler() : void
        {
            dispatchCanceled();
            return;
        }// end function

        private function createSnapshot() : void
        {
            this.view.isLoading = true;
            try
            {
                this.bitmap = this.snapshotFactory.create(this.broadcastCanvas.containers);
                this.snapshotService.send(this.bitmap.bitmapData);
            }
            catch (error:Error)
            {
                snapshotServiceFailureHandler("");
            }
            return;
        }// end function

        private function snapshotServiceSuccessHandler(param1:String) : void
        {
            var _loc_2:* = new Snapshot(this.bitmap, param1.replace(/\r|\n/g, ""));
            this.injector.mapValue(Snapshot, _loc_2);
            this.postChat.dispatch("I just took a video snapshot of this chatroom. Check it out here:");
            this.postChat.dispatch(_loc_2.pageUrl);
            dispatchGoNext();
            return;
        }// end function

        private function snapshotServiceFailureHandler(param1:String) : void
        {
            this.view.isLoading = false;
            return;
        }// end function

    }
}
