/// Module for [Frame] class
module gid.gtk4.frame;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Surrounds its child with a decorative frame and an optional label.
    
    <picture>
      <source srcset="frame-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkFrame" src="frame.png">
    </picture>
    
    If present, the label is drawn inside the top edge of the frame.
    The horizontal position of the label can be controlled with
    [gid.gtk4.frame.Frame.setLabelAlign].
    
    [gid.gtk4.frame.Frame] clips its child. You can use this to add rounded corners
    to widgets, but be aware that it also cuts off shadows.
    
    # GtkFrame as GtkBuildable
    
    An example of a UI definition fragment with GtkFrame:
    
    ```xml
    <object class="GtkFrame">
      <property name="label-widget">
        <object class="GtkLabel" id="frame_label"/>
      </property>
      <property name="child">
        <object class="GtkEntry" id="frame_content"/>
      </property>
    </object>
    ```
    
    # CSS nodes
    
    ```
    frame
    ├── <label widget>
    ╰── <child>
    ```
    
    [gid.gtk4.frame.Frame] has a main CSS node with name “frame”, which is used to draw the
    visible border. You can set the appearance of the border using CSS properties
    like “border-style” on this node.
    
    # Accessibility
    
    [gid.gtk4.frame.Frame] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class Frame : gid.gtk4.widget.Widget
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
      Get builder for [gid.gtk4.frame.Frame]
      Returns: New builder object
  */
  static FrameGidBuilder builder() nothrow
  {
    return new FrameGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `label` property.
      Returns: Text of the frame's label.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the frame's label.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `labelWidget` property.
      Returns: Widget to display in place of the usual frame label.
  */
  @property gid.gtk4.widget.Widget labelWidget() nothrow
  {
    return getLabelWidget();
  }

  /**
      Set `labelWidget` property.
      Params:
        propval = Widget to display in place of the usual frame label.
  */
  @property void labelWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setLabelWidget(propval);
  }

  /**
      Get `labelXalign` property.
      Returns: The horizontal alignment of the label.
  */
  @property float labelXalign() nothrow
  {
    return getLabelAlign();
  }

  /**
      Set `labelXalign` property.
      Params:
        propval = The horizontal alignment of the label.
  */
  @property void labelXalign(float propval) nothrow
  {
    setLabelAlign(propval);
  }

  /**
      Creates a new [gid.gtk4.frame.Frame], with optional label label.
      
      If label is null, the label is omitted.
  
      Params:
        label = the text to use as the label of the frame
      Returns: a new [gid.gtk4.frame.Frame] widget
  */
  this(string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_frame_new(_label);
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of frame.
      Returns: the child widget of frame
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_child(cast(GtkFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the frame labels text.
      
      If the frame's label widget is not a [gid.gtk4.label.Label], null
      is returned.
      Returns: the text in the label, or null if there
           was no label widget or the label widget was not a [gid.gtk4.label.Label].
           This string is owned by GTK and must not be modified or freed.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_frame_get_label(cast(GtkFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the X alignment of the frame’s label.
      Returns: the frames X alignment
  */
  float getLabelAlign() nothrow
  {
    float _retval;
    _retval = gtk_frame_get_label_align(cast(GtkFrame*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the label widget for the frame.
      Returns: the label widget
  */
  gid.gtk4.widget.Widget getLabelWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_label_widget(cast(GtkFrame*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of frame.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_frame_set_child(cast(GtkFrame*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Creates a new [gid.gtk4.label.Label] with the label and sets it as the frame's
      label widget.
  
      Params:
        label = the text to use as the label of the frame
  */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    gtk_frame_set_label(cast(GtkFrame*)this._cPtr, _label);
  }

  /**
      Sets the X alignment of the frame widget’s label.
      
      The default value for a newly created frame is 0.0.
  
      Params:
        xalign = The position of the label along the top edge
            of the widget. A value of 0.0 represents left alignment;
            1.0 represents right alignment.
  */
  void setLabelAlign(float xalign) nothrow
  {
    gtk_frame_set_label_align(cast(GtkFrame*)this._cPtr, xalign);
  }

  /**
      Sets the label widget for the frame.
      
      This is the widget that will appear embedded in the top edge
      of the frame as a title.
  
      Params:
        labelWidget = the new label widget
  */
  void setLabelWidget(gid.gtk4.widget.Widget labelWidget = null) nothrow
  {
    gtk_frame_set_label_widget(cast(GtkFrame*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.frame.Frame]
class FrameGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the frame's label.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `labelWidget` property.
      Params:
        propval = Widget to display in place of the usual frame label.
      Returns: Builder instance for fluent chaining
  */
  T labelWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("label-widget", propval);
  }

  /**
      Set `labelXalign` property.
      Params:
        propval = The horizontal alignment of the label.
      Returns: Builder instance for fluent chaining
  */
  T labelXalign(float propval) nothrow
  {
    return setProperty("label-xalign", propval);
  }
}

/// Fluent builder for [gid.gtk4.frame.Frame]
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
