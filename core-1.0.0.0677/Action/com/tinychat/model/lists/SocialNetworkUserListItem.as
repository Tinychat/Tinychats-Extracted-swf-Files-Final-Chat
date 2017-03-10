package com.tinychat.model.lists
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.model.utils.*;
    import flash.display.*;
    import flash.errors.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class SocialNetworkUserListItem extends SelectableUserListItem implements SocialNetworkUser
    {
        private var user:SocialNetworkUser;
        private var pictureLoader:ImageUrlLoader;

        public function SocialNetworkUserListItem(param1:SocialNetworkUser, param2:Class)
        {
            this.user = param1;
            this.user.presenceChanged.add(this.presenceChangedHandler);
            this.pictureLoader = new param2;
            super(param1);
            return;
        }// end function

        public function get renamed() : ISignal
        {
            return this.user.renamed;
        }// end function

        public function get presence() : PresenceType
        {
            return this.user.presence;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return this.user.presenceChanged;
        }// end function

        public function get pictureLoaded() : ISignal
        {
            return this.pictureLoader.loaded;
        }// end function

        public function get isPictureLoaded() : Boolean
        {
            return this.pictureLoader.isLoaded;
        }// end function

        public function get picture() : DisplayObject
        {
            return this.pictureLoader.picture;
        }// end function

        public function loadPicture() : void
        {
            this.pictureLoader.load(this.pictureUrl);
            return;
        }// end function

        protected function get pictureUrl() : String
        {
            throw new IllegalOperationError("Must be overriden in sub-class.");
        }// end function

        private function presenceChangedHandler(param1:PresenceType, param2:PresenceType) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "presence", param1, param2, this));
            return;
        }// end function

    }
}
