/// Module for [Frame] class
module gtk.frame;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    The frame widget is a bin that surrounds its child with a decorative
    frame and an optional label. If present, the label is drawn in a gap
    in the top side of the frame. The position of the label can be
    controlled with [gtk.frame.Frame.setLabelAlign].
    
    # GtkFrame as GtkBuildable
    
    The GtkFrame implementation of the #GtkBuildable interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can
    be specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with [gtk.frame.Frame]:
    
    ```xml
    <object class="GtkFrame">
      <child type="label">
        <object class="GtkLabel" id="frame-label"/>
      </child>
      <child>
        <object class="GtkEntry" id="frame-content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    frame
    ├── border[.flat]
    ├── <label widget>
    ╰── <child>
    ```
    
    GtkFrame has a main CSS node named “frame” and a subnode named “border”. The
    “border” node is used to draw the visible border. You can set the appearance
    of the border using CSS properties like “border-style” on the “border” node.
    
    The border node can be given the style class “.flat”, which is used by themes
    to disable drawing of the border. To do this from code, call
    [gtk.frame.Frame.setShadowType] with [gtk.types.ShadowType.None] to add the “.flat” class or
    any other shadow type to remove it.
*/
class Frame : gtk.bin.Bin
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
    return cast(void function())gtk_frame_get_type != &gidSymbolNotFound ? gtk_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self()
  {
    return this;
  }

  /**
      Get builder for [gtk.frame.Frame]
      Returns: New builder object
  */
  static FrameGidBuilder builder()
  {
    return new FrameGidBuilder;
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    setLabel(propval);
  }

  /** */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /** */
  @property void labelWidget(gtk.widget.Widget propval)
  {
    setLabelWidget(propval);
  }

  /** */
  @property float labelXalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("label-xalign");
  }

  /** */
  @property void labelXalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("label-xalign", propval);
  }

  /** */
  @property float labelYalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("label-yalign");
  }

  /** */
  @property void labelYalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("label-yalign", propval);
  }

  /** */
  @property gtk.types.ShadowType shadowType()
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gtk.types.ShadowType propval)
  {
    setShadowType(propval);
  }

  /**
      Creates a new #GtkFrame, with optional label label.
      If label is null, the label is omitted.
  
      Params:
        label = the text to use as the label of the frame
      Returns: a new #GtkFrame widget
  */
  this(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_frame_new(_label);
    this(_cretval, No.Take);
  }

  /**
      If the frame’s label widget is a #GtkLabel, returns the
      text in the label widget. (The frame will have a #GtkLabel
      for the label widget if a non-null argument was passed
      to [gtk.frame.Frame.new_].)
      Returns: the text in the label, or null if there
                      was no label widget or the lable widget was not
                      a #GtkLabel. This string is owned by GTK+ and
                      must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_frame_get_label(cast(GtkFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the X and Y alignment of the frame’s label. See
      [gtk.frame.Frame.setLabelAlign].
  
      Params:
        xalign = location to store X alignment of
              frame’s label, or null
        yalign = location to store X alignment of
              frame’s label, or null
  */
  void getLabelAlign(out float xalign, out float yalign)
  {
    gtk_frame_get_label_align(cast(GtkFrame*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Retrieves the label widget for the frame. See
      [gtk.frame.Frame.setLabelWidget].
      Returns: the label widget, or null if
        there is none.
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_label_widget(cast(GtkFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the shadow type of the frame. See
      [gtk.frame.Frame.setShadowType].
      Returns: the current shadow type of the frame.
  */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_frame_get_shadow_type(cast(GtkFrame*)this._cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Removes the current #GtkFrame:label-widget. If label is not null, creates a
      new #GtkLabel with that text and adds it as the #GtkFrame:label-widget.
  
      Params:
        label = the text to use as the label of the frame
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_frame_set_label(cast(GtkFrame*)this._cPtr, _label);
  }

  /**
      Sets the alignment of the frame widget’s label. The
      default values for a newly created frame are 0.0 and 0.5.
  
      Params:
        xalign = The position of the label along the top edge
            of the widget. A value of 0.0 represents left alignment;
            1.0 represents right alignment.
        yalign = The y alignment of the label. A value of 0.0 aligns under
            the frame; 1.0 aligns above the frame. If the values are exactly
            0.0 or 1.0 the gap in the frame won’t be painted because the label
            will be completely above or below the frame.
  */
  void setLabelAlign(float xalign, float yalign)
  {
    gtk_frame_set_label_align(cast(GtkFrame*)this._cPtr, xalign, yalign);
  }

  /**
      Sets the #GtkFrame:label-widget for the frame. This is the widget that
      will appear embedded in the top edge of the frame as a title.
  
      Params:
        labelWidget = the new label widget
  */
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_frame_set_label_widget(cast(GtkFrame*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkFrame:shadow-type for frame, i.e. whether it is drawn without
      ([gtk.types.ShadowType.None]) or with (other values) a visible border. Values other than
      [gtk.types.ShadowType.None] are treated identically by GtkFrame. The chosen type is
      applied by removing or adding the .flat class to the CSS node named border.
  
      Params:
        type = the new #GtkShadowType
  */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_frame_set_shadow_type(cast(GtkFrame*)this._cPtr, type);
  }
}

/// Fluent builder implementation template for [gtk.frame.Frame]
class FrameGidBuilderImpl(T) : gtk.bin.BinGidBuilderImpl!T
{


  /** */
  T label(string propval)
  {
    return setProperty("label", propval);
  }

  /** */
  T labelWidget(gtk.widget.Widget propval)
  {
    return setProperty("label-widget", propval);
  }

  /** */
  T labelXalign(float propval)
  {
    return setProperty("label-xalign", propval);
  }

  /** */
  T labelYalign(float propval)
  {
    return setProperty("label-yalign", propval);
  }

  /** */
  T shadowType(gtk.types.ShadowType propval)
  {
    return setProperty("shadow-type", propval);
  }
}

/// Fluent builder for [gtk.frame.Frame]
final class FrameGidBuilder : FrameGidBuilderImpl!FrameGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Frame build()
  {
    return new Frame(cast(void*)createGObject(Frame._getGType), No.Take);
  }
}
