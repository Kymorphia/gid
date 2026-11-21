/// Module for [Misc] class
module gid.gtk3.misc;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkMisc widget is an abstract widget which is not useful itself, but
    is used to derive subclasses which have alignment and padding attributes.
    
    The horizontal and vertical padding attributes allows extra space to be
    added around the widget.
    
    The horizontal and vertical alignment attributes enable the widget to be
    positioned within its allocated area. Note that if the widget is added to
    a container in such a way that it expands automatically to fill its
    allocated area, the alignment settings will not alter the widget's position.
    
    Note that the desired effect can in most cases be achieved by using the
    #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties
    on the child widget, so GtkMisc should not be used in new code. To reflect
    this fact, all #GtkMisc API has been deprecated.
*/
class Misc : gid.gtk3.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_misc_get_type != &gidSymbolNotFound ? gtk_misc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMisc";
  }

  /** Returns `this`, for use in `with` statements. */
  override Misc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.misc.Misc]
      Returns: New builder object
  */
  static MiscGidBuilder builder() nothrow
  {
    return new MiscGidBuilder;
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment. A value of 0.0 means left alignment (or right
        on RTL locales); a value of 1.0 means right alignment (or left on RTL
        locales).
  
      Deprecated: Use [gid.gtk4.widget.Widget.setHalign] instead. If you are using
          #GtkLabel, use #GtkLabel:xalign instead.
  */
  @property float xalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment. A value of 0.0 means left alignment (or right
          on RTL locales); a value of 1.0 means right alignment (or left on RTL
          locales).
  
      Deprecated: Use [gid.gtk4.widget.Widget.setHalign] instead. If you are using
          #GtkLabel, use #GtkLabel:xalign instead.
  */
  @property void xalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `xpad` property.
      Returns: The amount of space to add on the left and right of the widget, in
        pixels.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginStart] and
          [gid.gtk4.widget.Widget.setMarginEnd] instead
  */
  @property int xpad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("xpad");
  }

  /**
      Set `xpad` property.
      Params:
        propval = The amount of space to add on the left and right of the widget, in
          pixels.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginStart] and
          [gid.gtk4.widget.Widget.setMarginEnd] instead
  */
  @property void xpad(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("xpad", propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment. A value of 0.0 means top alignment;
        a value of 1.0 means bottom alignment.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setValign] instead. If you are using
          #GtkLabel, use #GtkLabel:yalign instead.
  */
  @property float yalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment. A value of 0.0 means top alignment;
          a value of 1.0 means bottom alignment.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setValign] instead. If you are using
          #GtkLabel, use #GtkLabel:yalign instead.
  */
  @property void yalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /**
      Get `ypad` property.
      Returns: The amount of space to add on the top and bottom of the widget, in
        pixels.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginTop] and
          [gid.gtk4.widget.Widget.setMarginBottom] instead
  */
  @property int ypad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("ypad");
  }

  /**
      Set `ypad` property.
      Params:
        propval = The amount of space to add on the top and bottom of the widget, in
          pixels.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginTop] and
          [gid.gtk4.widget.Widget.setMarginBottom] instead
  */
  @property void ypad(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("ypad", propval);
  }

  /**
      Gets the X and Y alignment of the widget within its allocation.
      See [gid.gtk3.misc.Misc.setAlignment].
  
      Params:
        xalign = location to store X alignment of misc, or null
        yalign = location to store Y alignment of misc, or null
  
      Deprecated: Use #GtkWidget alignment and margin properties.
  */
  void getAlignment(out float xalign, out float yalign) nothrow
  {
    gtk_misc_get_alignment(cast(GtkMisc*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Gets the padding in the X and Y directions of the widget.
      See [gid.gtk3.misc.Misc.setPadding].
  
      Params:
        xpad = location to store padding in the X
                 direction, or null
        ypad = location to store padding in the Y
                 direction, or null
  
      Deprecated: Use #GtkWidget alignment and margin properties.
  */
  void getPadding(out int xpad, out int ypad) nothrow
  {
    gtk_misc_get_padding(cast(GtkMisc*)this._cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Sets the alignment of the widget.
  
      Params:
        xalign = the horizontal alignment, from 0 (left) to 1 (right).
        yalign = the vertical alignment, from 0 (top) to 1 (bottom).
  
      Deprecated: Use #GtkWidget's alignment (#GtkWidget:halign and #GtkWidget:valign) and margin properties or #GtkLabel's #GtkLabel:xalign and #GtkLabel:yalign properties.
  */
  void setAlignment(float xalign, float yalign) nothrow
  {
    gtk_misc_set_alignment(cast(GtkMisc*)this._cPtr, xalign, yalign);
  }

  /**
      Sets the amount of space to add around the widget.
  
      Params:
        xpad = the amount of space to add on the left and right of the widget,
            in pixels.
        ypad = the amount of space to add on the top and bottom of the widget,
            in pixels.
  
      Deprecated: Use #GtkWidget alignment and margin properties.
  */
  void setPadding(int xpad, int ypad) nothrow
  {
    gtk_misc_set_padding(cast(GtkMisc*)this._cPtr, xpad, ypad);
  }
}

/// Fluent builder implementation template for [gid.gtk3.misc.Misc]
class MiscGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment. A value of 0.0 means left alignment (or right
          on RTL locales); a value of 1.0 means right alignment (or left on RTL
          locales).
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.widget.Widget.setHalign] instead. If you are using
          #GtkLabel, use #GtkLabel:xalign instead.
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `xpad` property.
      Params:
        propval = The amount of space to add on the left and right of the widget, in
          pixels.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginStart] and
          [gid.gtk4.widget.Widget.setMarginEnd] instead
  */
  T xpad(int propval) nothrow
  {
    return setProperty("xpad", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment. A value of 0.0 means top alignment;
          a value of 1.0 means bottom alignment.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.widget.Widget.setValign] instead. If you are using
          #GtkLabel, use #GtkLabel:yalign instead.
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }

  /**
      Set `ypad` property.
      Params:
        propval = The amount of space to add on the top and bottom of the widget, in
          pixels.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginTop] and
          [gid.gtk4.widget.Widget.setMarginBottom] instead
  */
  T ypad(int propval) nothrow
  {
    return setProperty("ypad", propval);
  }
}

/// Fluent builder for [gid.gtk3.misc.Misc]
final class MiscGidBuilder : MiscGidBuilderImpl!MiscGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Misc build() nothrow
  {
    return new Misc(cast(void*)createGObject(Misc._getGType), Yes.Take);
  }
}
