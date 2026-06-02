/// Module for [AspectFrame] class
module gtk.aspect_frame;

public import gid.basictypes;
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
    [gtk.aspect_frame.AspectFrame] preserves the aspect ratio of its child.
    
    The frame can respect the aspect ratio of the child widget,
    or use its own aspect ratio.
    
    # CSS nodes
    
    [gtk.aspect_frame.AspectFrame] uses a CSS node with name `frame`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.aspect_frame.AspectFrame] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.aspect_frame.AspectFrame] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class AspectFrame : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_aspect_frame_get_type != &gidSymbolNotFound ? gtk_aspect_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AspectFrame self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.aspect_frame.AspectFrame]
      Returns: New builder object
  */
  static AspectFrameGidBuilder builder() nothrow
  {
    return new AspectFrameGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `obeyChild` property.
      Returns: Whether the [gtk.aspect_frame.AspectFrame] should use the aspect ratio of its child.
  */
  @property bool obeyChild() nothrow
  {
    return getObeyChild();
  }

  /**
      Set `obeyChild` property.
      Params:
        propval = Whether the [gtk.aspect_frame.AspectFrame] should use the aspect ratio of its child.
  */
  @property void obeyChild(bool propval) nothrow
  {
    setObeyChild(propval);
  }

  /**
      Get `ratio` property.
      Returns: The aspect ratio to be used by the [gtk.aspect_frame.AspectFrame].
        
        This property is only used if
        [gtk.aspect_frame.AspectFrame.obeyChild] is set to false.
  */
  @property float ratio() nothrow
  {
    return getRatio();
  }

  /**
      Set `ratio` property.
      Params:
        propval = The aspect ratio to be used by the [gtk.aspect_frame.AspectFrame].
          
          This property is only used if
          [gtk.aspect_frame.AspectFrame.obeyChild] is set to false.
  */
  @property void ratio(float propval) nothrow
  {
    setRatio(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the child.
  */
  @property float xalign() nothrow
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the child.
  */
  @property void xalign(float propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the child.
  */
  @property float yalign() nothrow
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the child.
  */
  @property void yalign(float propval) nothrow
  {
    setYalign(propval);
  }

  /**
      Create a new [gtk.aspect_frame.AspectFrame].
  
      Params:
        xalign = Horizontal alignment of the child within the parent.
            Ranges from 0.0 (left aligned) to 1.0 (right aligned)
        yalign = Vertical alignment of the child within the parent.
            Ranges from 0.0 (top aligned) to 1.0 (bottom aligned)
        ratio = The desired aspect ratio.
        obeyChild = If true, ratio is ignored, and the aspect
            ratio is taken from the requistion of the child.
      Returns: the new [gtk.aspect_frame.AspectFrame].
  */
  this(float xalign, float yalign, float ratio, bool obeyChild) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_aspect_frame_new(xalign, yalign, ratio, obeyChild);
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_aspect_frame_get_child(cast(GtkAspectFrame*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the child's size request should override
      the set aspect ratio of the [gtk.aspect_frame.AspectFrame].
      Returns: whether to obey the child's size request
  */
  bool getObeyChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_aspect_frame_get_obey_child(cast(GtkAspectFrame*)this._cPtr);
    return _retval;
  }

  /**
      Returns the desired aspect ratio of the child.
      Returns: the desired aspect ratio
  */
  float getRatio() nothrow
  {
    float _retval;
    _retval = gtk_aspect_frame_get_ratio(cast(GtkAspectFrame*)this._cPtr);
    return _retval;
  }

  /**
      Returns the horizontal alignment of the child within the
      allocation of the [gtk.aspect_frame.AspectFrame].
      Returns: the horizontal alignment
  */
  float getXalign() nothrow
  {
    float _retval;
    _retval = gtk_aspect_frame_get_xalign(cast(GtkAspectFrame*)this._cPtr);
    return _retval;
  }

  /**
      Returns the vertical alignment of the child within the
      allocation of the [gtk.aspect_frame.AspectFrame].
      Returns: the vertical alignment
  */
  float getYalign() nothrow
  {
    float _retval;
    _retval = gtk_aspect_frame_get_yalign(cast(GtkAspectFrame*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    gtk_aspect_frame_set_child(cast(GtkAspectFrame*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the aspect ratio of the child's size
      request should override the set aspect ratio of
      the [gtk.aspect_frame.AspectFrame].
  
      Params:
        obeyChild = If true, ratio is ignored, and the aspect
             ratio is taken from the requisition of the child.
  */
  void setObeyChild(bool obeyChild) nothrow
  {
    gtk_aspect_frame_set_obey_child(cast(GtkAspectFrame*)this._cPtr, obeyChild);
  }

  /**
      Sets the desired aspect ratio of the child.
  
      Params:
        ratio = aspect ratio of the child
  */
  void setRatio(float ratio) nothrow
  {
    gtk_aspect_frame_set_ratio(cast(GtkAspectFrame*)this._cPtr, ratio);
  }

  /**
      Sets the horizontal alignment of the child within the allocation
      of the [gtk.aspect_frame.AspectFrame].
  
      Params:
        xalign = horizontal alignment, from 0.0 (left aligned) to 1.0 (right aligned)
  */
  void setXalign(float xalign) nothrow
  {
    gtk_aspect_frame_set_xalign(cast(GtkAspectFrame*)this._cPtr, xalign);
  }

  /**
      Sets the vertical alignment of the child within the allocation
      of the [gtk.aspect_frame.AspectFrame].
  
      Params:
        yalign = horizontal alignment, from 0.0 (top aligned) to 1.0 (bottom aligned)
  */
  void setYalign(float yalign) nothrow
  {
    gtk_aspect_frame_set_yalign(cast(GtkAspectFrame*)this._cPtr, yalign);
  }
}

/// Fluent builder implementation template for [gtk.aspect_frame.AspectFrame]
class AspectFrameGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `obeyChild` property.
      Params:
        propval = Whether the [gtk.aspect_frame.AspectFrame] should use the aspect ratio of its child.
      Returns: Builder instance for fluent chaining
  */
  T obeyChild(bool propval) nothrow
  {
    return setProperty("obey-child", propval);
  }

  /**
      Set `ratio` property.
      Params:
        propval = The aspect ratio to be used by the [gtk.aspect_frame.AspectFrame].
          
          This property is only used if
          [gtk.aspect_frame.AspectFrame.obeyChild] is set to false.
      Returns: Builder instance for fluent chaining
  */
  T ratio(float propval) nothrow
  {
    return setProperty("ratio", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the child.
      Returns: Builder instance for fluent chaining
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the child.
      Returns: Builder instance for fluent chaining
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }
}

/// Fluent builder for [gtk.aspect_frame.AspectFrame]
final class AspectFrameGidBuilder : AspectFrameGidBuilderImpl!AspectFrameGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AspectFrame build() nothrow
  {
    return new AspectFrame(cast(void*)createGObject(AspectFrame._getGType), No.Take);
  }
}
