package 
{
    import en_US$layout_properties.*;
    import mx.resources.*;

    public class en_US$layout_properties extends ResourceBundle
    {

        public function en_US$layout_properties()
        {
            super("en_US", "layout");
            return;
        }// end function

        override protected function getContent() : Object
        {
            var _loc_1:Object = {rowNotFound:"ConstraintRow \'{0}\' not found.", constraintLayoutNotVirtualized:"ConstraintLayout doesn\'t support virtualization.", basicLayoutNotVirtualized:"BasicLayout doesn\'t support virtualization.", columnNotFound:"ConstraintColumn \'{0}\' not found.", invalidIndex:"invalidIndex", invalidBaselineOnRow:"Invalid baseline value on row {0}: \'{1}\'. Must be a Number or of the form \'maxAscent:x\'."};
            return _loc_1;
        }// end function

    }
}
