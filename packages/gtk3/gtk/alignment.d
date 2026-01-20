/// Module for [Alignment] class
module gtk.alignment;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkAlignment widget controls the alignment and size of its child widget.
    It has four settings: xscale, yscale, xalign, and yalign.
    
    The scale settings are used to specify how much the child widget should
    expand to fill the space allocated to the #GtkAlignment.
    The values can range from 0 (meaning the child doesn’t expand at all) to
    1 (meaning the child expands to fill all of the available space).
    
    The align settings are used to place the child widget within the available
    area. The values range from 0 (top or left) to 1 (bottom or right).
    Of course, if the scale settings are both set to 1, the alignment settings
    have no effect.
    
    GtkAlignment has been deprecated in 3.14 and should not be used in
    newly-written code. The desired effect can be achieved by using the
    #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties on the
    child widget.
*/
class Alignment : gtk.bin.Bin
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alignment_get_type != &gidSymbolNotFound ? gtk_alignment_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Alignment self()
  {
    return this;
  }

  /**
      Get `bottomPadding` property.
      Returns: The padding to insert at the bottom of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginBottom] instead
  */
  @property uint bottomPadding()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("bottom-padding");
  }

  /**
      Set `bottomPadding` property.
      Params:
        propval = The padding to insert at the bottom of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginBottom] instead
  */
  @property void bottomPadding(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("bottom-padding", propval);
  }

  /**
      Get `leftPadding` property.
      Returns: The padding to insert at the left of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginStart] instead
  */
  @property uint leftPadding()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("left-padding");
  }

  /**
      Set `leftPadding` property.
      Params:
        propval = The padding to insert at the left of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginStart] instead
  */
  @property void leftPadding(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("left-padding", propval);
  }

  /**
      Get `rightPadding` property.
      Returns: The padding to insert at the right of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginEnd] instead
  */
  @property uint rightPadding()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("right-padding");
  }

  /**
      Set `rightPadding` property.
      Params:
        propval = The padding to insert at the right of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginEnd] instead
  */
  @property void rightPadding(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("right-padding", propval);
  }

  /**
      Get `topPadding` property.
      Returns: The padding to insert at the top of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginTop] instead
  */
  @property uint topPadding()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("top-padding");
  }

  /**
      Set `topPadding` property.
      Params:
        propval = The padding to insert at the top of the widget.
  
      Deprecated: Use [gtk.widget.Widget.setMarginTop] instead
  */
  @property void topPadding(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("top-padding", propval);
  }

  /**
      Get `xalign` property.
      Returns: Horizontal position of child in available space. A value of 0.0
        will flush the child left (or right, in RTL locales); a value
        of 1.0 will flush the child right (or left, in RTL locales).
  
      Deprecated: Use [gtk.widget.Widget.setHalign] on the child instead
  */
  @property float xalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = Horizontal position of child in available space. A value of 0.0
          will flush the child left (or right, in RTL locales); a value
          of 1.0 will flush the child right (or left, in RTL locales).
  
      Deprecated: Use [gtk.widget.Widget.setHalign] on the child instead
  */
  @property void xalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `xscale` property.
      Returns: If available horizontal space is bigger than needed, how much
        of it to use for the child. A value of 0.0 means none; a value
        of 1.0 means all.
  
      Deprecated: Use [gtk.widget.Widget.setHexpand] on the child instead
  */
  @property float xscale()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xscale");
  }

  /**
      Set `xscale` property.
      Params:
        propval = If available horizontal space is bigger than needed, how much
          of it to use for the child. A value of 0.0 means none; a value
          of 1.0 means all.
  
      Deprecated: Use [gtk.widget.Widget.setHexpand] on the child instead
  */
  @property void xscale(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xscale", propval);
  }

  /**
      Get `yalign` property.
      Returns: Vertical position of child in available space. A value of 0.0
        will flush the child to the top; a value of 1.0 will flush the
        child to the bottom.
  
      Deprecated: Use [gtk.widget.Widget.setValign] on the child instead
  */
  @property float yalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /**
      Set `yalign` property.
      Params:
        propval = Vertical position of child in available space. A value of 0.0
          will flush the child to the top; a value of 1.0 will flush the
          child to the bottom.
  
      Deprecated: Use [gtk.widget.Widget.setValign] on the child instead
  */
  @property void yalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /**
      Get `yscale` property.
      Returns: If available vertical space is bigger than needed, how much
        of it to use for the child. A value of 0.0 means none; a value
        of 1.0 means all.
  
      Deprecated: Use [gtk.widget.Widget.setVexpand] on the child instead
  */
  @property float yscale()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("yscale");
  }

  /**
      Set `yscale` property.
      Params:
        propval = If available vertical space is bigger than needed, how much
          of it to use for the child. A value of 0.0 means none; a value
          of 1.0 means all.
  
      Deprecated: Use [gtk.widget.Widget.setVexpand] on the child instead
  */
  @property void yscale(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("yscale", propval);
  }

  /**
      Creates a new #GtkAlignment.
  
      Params:
        xalign = the horizontal alignment of the child widget, from 0 (left) to 1
           (right).
        yalign = the vertical alignment of the child widget, from 0 (top) to 1
           (bottom).
        xscale = the amount that the child widget expands horizontally to fill up
           unused space, from 0 to 1.
           A value of 0 indicates that the child widget should never expand.
           A value of 1 indicates that the child widget will expand to fill all of the
           space allocated for the #GtkAlignment.
        yscale = the amount that the child widget expands vertically to fill up
           unused space, from 0 to 1. The values are similar to xscale.
      Returns: the new #GtkAlignment
  
      Deprecated: Use #GtkWidget alignment and margin properties
  */
  this(float xalign, float yalign, float xscale, float yscale)
  {
    GtkWidget* _cretval;
    _cretval = gtk_alignment_new(xalign, yalign, xscale, yscale);
    this(_cretval, No.Take);
  }

  /**
      Gets the padding on the different sides of the widget.
      See gtk_alignment_set_padding ().
  
      Params:
        paddingTop = location to store the padding for
              the top of the widget, or null
        paddingBottom = location to store the padding
              for the bottom of the widget, or null
        paddingLeft = location to store the padding
              for the left of the widget, or null
        paddingRight = location to store the padding
              for the right of the widget, or null
  
      Deprecated: Use #GtkWidget alignment and margin properties
  */
  void getPadding(out uint paddingTop, out uint paddingBottom, out uint paddingLeft, out uint paddingRight)
  {
    gtk_alignment_get_padding(cast(GtkAlignment*)this._cPtr, cast(uint*)&paddingTop, cast(uint*)&paddingBottom, cast(uint*)&paddingLeft, cast(uint*)&paddingRight);
  }

  /**
      Sets the #GtkAlignment values.
  
      Params:
        xalign = the horizontal alignment of the child widget, from 0 (left) to 1
           (right).
        yalign = the vertical alignment of the child widget, from 0 (top) to 1
           (bottom).
        xscale = the amount that the child widget expands horizontally to fill up
           unused space, from 0 to 1.
           A value of 0 indicates that the child widget should never expand.
           A value of 1 indicates that the child widget will expand to fill all of the
           space allocated for the #GtkAlignment.
        yscale = the amount that the child widget expands vertically to fill up
           unused space, from 0 to 1. The values are similar to xscale.
  
      Deprecated: Use #GtkWidget alignment and margin properties
  */
  void set(float xalign, float yalign, float xscale, float yscale)
  {
    gtk_alignment_set(cast(GtkAlignment*)this._cPtr, xalign, yalign, xscale, yscale);
  }

  /**
      Sets the padding on the different sides of the widget.
      The padding adds blank space to the sides of the widget. For instance,
      this can be used to indent the child widget towards the right by adding
      padding on the left.
  
      Params:
        paddingTop = the padding at the top of the widget
        paddingBottom = the padding at the bottom of the widget
        paddingLeft = the padding at the left of the widget
        paddingRight = the padding at the right of the widget.
  
      Deprecated: Use #GtkWidget alignment and margin properties
  */
  void setPadding(uint paddingTop, uint paddingBottom, uint paddingLeft, uint paddingRight)
  {
    gtk_alignment_set_padding(cast(GtkAlignment*)this._cPtr, paddingTop, paddingBottom, paddingLeft, paddingRight);
  }
}
