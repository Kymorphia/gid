/// Module for [Frame] class
module gid.gtk3.frame;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The frame widget is a bin that surrounds its child with a decorative
    frame and an optional label. If present, the label is drawn in a gap
    in the top side of the frame. The position of the label can be
    controlled with [gid.gtk4.frame.Frame.setLabelAlign].
    
    # GtkFrame as GtkBuildable
    
    The GtkFrame implementation of the #GtkBuildable interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can
    be specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with [gid.gtk4.frame.Frame]:
    
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
    [gid.gtk3.frame.Frame.setShadowType] with [gid.gtk3.types.ShadowType.None] to add the “.flat” class or
    any other shadow type to remove it.
*/
class Frame : gid.gtk3.bin.Bin
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
    return cast(void function())gtk_frame_get_type != &gidSymbolNotFound ? gtk_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFrame";
  }

  /** Returns `this`, for use in `with` statements. */
  override Frame self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.frame.Frame]
      Returns: New builder object
  */
  static FrameGidBuilder builder() nothrow
  {
    return new FrameGidBuilder;
  }

  /** */
  @property string label() nothrow
  {
    return getLabel();
  }

  /** */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /** */
  @property gid.gtk3.widget.Widget labelWidget() nothrow
  {
    return getLabelWidget();
  }

  /** */
  @property void labelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    setLabelWidget(propval);
  }

  /** */
  @property float labelXalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("label-xalign");
  }

  /** */
  @property void labelXalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("label-xalign", propval);
  }

  /** */
  @property float labelYalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("label-yalign");
  }

  /** */
  @property void labelYalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("label-yalign", propval);
  }

  /** */
  @property gid.gtk3.types.ShadowType shadowType() nothrow
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gid.gtk3.types.ShadowType propval) nothrow
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
  this(string label = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, label !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_frame_new(_label);
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncComputeChildAllocation(gid.gtk3.types.Allocation allocation)
  {
    auto _klass = cast(GtkFrameClass*)_vfuncClass;
    if (!_klass.computeChildAllocation)
      return;

    _klass.computeChildAllocation(cast(GtkFrame*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      If the frame’s label widget is a #GtkLabel, returns the
      text in the label widget. (The frame will have a #GtkLabel
      for the label widget if a non-null argument was passed
      to [gid.gtk4.frame.Frame.new_].)
      Returns: the text in the label, or null if there
                      was no label widget or the lable widget was not
                      a #GtkLabel. This string is owned by GTK+ and
                      must not be modified or freed.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_frame_get_label(cast(GtkFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the X and Y alignment of the frame’s label. See
      [gid.gtk4.frame.Frame.setLabelAlign].
  
      Params:
        xalign = location to store X alignment of
              frame’s label, or null
        yalign = location to store X alignment of
              frame’s label, or null
  */
  void getLabelAlign(out float xalign, out float yalign) nothrow
  {
    gtk_frame_get_label_align(cast(GtkFrame*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Retrieves the label widget for the frame. See
      [gid.gtk4.frame.Frame.setLabelWidget].
      Returns: the label widget, or null if
        there is none.
  */
  gid.gtk3.widget.Widget getLabelWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_label_widget(cast(GtkFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the shadow type of the frame. See
      [gid.gtk3.frame.Frame.setShadowType].
      Returns: the current shadow type of the frame.
  */
  gid.gtk3.types.ShadowType getShadowType() nothrow
  {
    GtkShadowType _cretval;
    _cretval = gtk_frame_get_shadow_type(cast(GtkFrame*)this._cPtr);
    gid.gtk3.types.ShadowType _retval = cast(gid.gtk3.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Removes the current #GtkFrame:label-widget. If label is not null, creates a
      new #GtkLabel with that text and adds it as the #GtkFrame:label-widget.
  
      Params:
        label = the text to use as the label of the frame
  */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
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
  void setLabelAlign(float xalign, float yalign) nothrow
  {
    gtk_frame_set_label_align(cast(GtkFrame*)this._cPtr, xalign, yalign);
  }

  /**
      Sets the #GtkFrame:label-widget for the frame. This is the widget that
      will appear embedded in the top edge of the frame as a title.
  
      Params:
        labelWidget = the new label widget
  */
  void setLabelWidget(gid.gtk3.widget.Widget labelWidget = null) nothrow
  {
    gtk_frame_set_label_widget(cast(GtkFrame*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkFrame:shadow-type for frame, i.e. whether it is drawn without
      ([gid.gtk3.types.ShadowType.None]) or with (other values) a visible border. Values other than
      [gid.gtk3.types.ShadowType.None] are treated identically by GtkFrame. The chosen type is
      applied by removing or adding the .flat class to the CSS node named border.
  
      Params:
        type = the new #GtkShadowType
  */
  void setShadowType(gid.gtk3.types.ShadowType type) nothrow
  {
    gtk_frame_set_shadow_type(cast(GtkFrame*)this._cPtr, type);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Frame
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.frame.Frame), T.stringof ~ " is not derived from gid.gtk3.frame.Frame");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncComputeChildAllocation", true)[0]) == gid.gtk3.frame.Frame))
      _installVfunc(klass, "compute_child_allocation");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkFrameClass*)klass;

    switch (vfunc)
    {
      case "compute_child_allocation":
      {
        static extern(C) void _vfuncComputeChildAllocationTramp(GtkFrame* frame, GtkAllocation* allocation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.frame.Frame)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)frame);
          if (!_obj)
          {
            auto _klass = cast(GtkFrameClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)frame);
            if (_klass.computeChildAllocation)
              return (cast(typeof(&_vfuncComputeChildAllocationTramp))_klass.computeChildAllocation)(frame, allocation);
            return;
          }

          try
          {
            _obj.vfuncComputeChildAllocation(*cast(gid.gtk3.types.Allocation*)allocation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.frame.Frame.vfuncComputeChildAllocation");
          }
        }

        _klass.computeChildAllocation = cast(typeof(_klass.computeChildAllocation))&_vfuncComputeChildAllocationTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.frame.Frame]
class FrameGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{


  /** */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /** */
  T labelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("label-widget", propval);
  }

  /** */
  T labelXalign(float propval) nothrow
  {
    return setProperty("label-xalign", propval);
  }

  /** */
  T labelYalign(float propval) nothrow
  {
    return setProperty("label-yalign", propval);
  }

  /** */
  T shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    return setProperty("shadow-type", propval);
  }
}

/// Fluent builder for [gid.gtk3.frame.Frame]
final class FrameGidBuilder : FrameGidBuilderImpl!FrameGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Frame build() nothrow
  {
    return new Frame(cast(void*)createGObject(Frame._getGType), Yes.Take);
  }
}
