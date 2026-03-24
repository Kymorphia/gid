/// Module for [Frame] class
module gtk.frame;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.frame.Frame] is a widget that surrounds its child with a decorative
    frame and an optional label.
    
    ![An example GtkFrame](frame.png)
    
    If present, the label is drawn inside the top edge of the frame.
    The horizontal position of the label can be controlled with
    [gtk.frame.Frame.setLabelAlign].
    
    [gtk.frame.Frame] clips its child. You can use this to add rounded corners
    to widgets, but be aware that it also cuts off shadows.
    
    # GtkFrame as GtkBuildable
    
    The [gtk.frame.Frame] implementation of the [gtk.buildable.Buildable] interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can
    be specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with GtkFrame:
    ```xml
    <object class="GtkFrame">
      <child type="label">
        <object class="GtkLabel" id="frame_label"/>
      </child>
      <child>
        <object class="GtkEntry" id="frame_content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```
    frame
    ├── <label widget>
    ╰── <child>
    ```
    
    [gtk.frame.Frame] has a main CSS node with name “frame”, which is used to draw the
    visible border. You can set the appearance of the border using CSS properties
    like “border-style” on this node.
    
    # Accessibility
    
    [gtk.frame.Frame] uses the [gtk.types.AccessibleRole.Group] role.
*/
class Frame : gtk.widget.Widget
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

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Get `label` property.
      Returns: Text of the frame's label.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the frame's label.
  */
  @property void label(string propval)
  {
    setLabel(propval);
  }

  /**
      Get `labelWidget` property.
      Returns: Widget to display in place of the usual frame label.
  */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /**
      Set `labelWidget` property.
      Params:
        propval = Widget to display in place of the usual frame label.
  */
  @property void labelWidget(gtk.widget.Widget propval)
  {
    setLabelWidget(propval);
  }

  /**
      Get `labelXalign` property.
      Returns: The horizontal alignment of the label.
  */
  @property float labelXalign()
  {
    return getLabelAlign();
  }

  /**
      Set `labelXalign` property.
      Params:
        propval = The horizontal alignment of the label.
  */
  @property void labelXalign(float propval)
  {
    setLabelAlign(propval);
  }

  /**
      Creates a new [gtk.frame.Frame], with optional label label.
      
      If label is null, the label is omitted.
  
      Params:
        label = the text to use as the label of the frame
      Returns: a new [gtk.frame.Frame] widget
  */
  this(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_frame_new(_label);
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of frame.
      Returns: the child widget of frame
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_child(cast(GtkFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the frame labels text.
      
      If the frame's label widget is not a [gtk.label.Label], null
      is returned.
      Returns: the text in the label, or null if there
           was no label widget or the label widget was not a [gtk.label.Label].
           This string is owned by GTK and must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_frame_get_label(cast(GtkFrame*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the X alignment of the frame’s label.
      Returns: the frames X alignment
  */
  float getLabelAlign()
  {
    float _retval;
    _retval = gtk_frame_get_label_align(cast(GtkFrame*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the label widget for the frame.
      Returns: the label widget
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_frame_get_label_widget(cast(GtkFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of frame.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_frame_set_child(cast(GtkFrame*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Creates a new [gtk.label.Label] with the label and sets it as the frame's
      label widget.
  
      Params:
        label = the text to use as the label of the frame
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
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
  void setLabelAlign(float xalign)
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
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_frame_set_label_widget(cast(GtkFrame*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }
}

class FrameGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the frame's label.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval)
  {
    return setProperty("label", propval);
  }

  /**
      Set `labelWidget` property.
      Params:
        propval = Widget to display in place of the usual frame label.
      Returns: Builder instance for fluent chaining
  */
  T labelWidget(gtk.widget.Widget propval)
  {
    return setProperty("label-widget", propval);
  }

  /**
      Set `labelXalign` property.
      Params:
        propval = The horizontal alignment of the label.
      Returns: Builder instance for fluent chaining
  */
  T labelXalign(float propval)
  {
    return setProperty("label-xalign", propval);
  }
}

/// Fluent builder for [gtk.frame.Frame]
final class FrameGidBuilder : FrameGidBuilderImpl!FrameGidBuilder
{
  Frame build()
  {
    return new Frame(cast(void*)createGObject(Frame._getGType), No.Take);
  }
}
