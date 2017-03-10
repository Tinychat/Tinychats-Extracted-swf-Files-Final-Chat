package mx.controls.dataGridClasses
{
    import mx.controls.listClasses.*;
    import mx.core.*;

    public class DataGridListData extends BaseListData
    {
        public var dataField:String;
        static const VERSION:String = "4.6.0.23201";

        public function DataGridListData(text:String, dataField:String, columnIndex:int, uid:String, owner:IUIComponent, rowIndex:int = 0)
        {
            super(text, uid, owner, rowIndex, columnIndex);
            this.dataField = dataField;
            return;
        }// end function

    }
}
