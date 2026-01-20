/// Module for [AspectFrame] class
module gtk.aspect_frame;

import gid.gid;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_aspect_frame_get_type != &gidSymbolNotFound ? gtk_aspect_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AspectFrame self()
  {
    return this;
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
    return setChild(propval);
  }

  /**
      Get `obeyChild` property.
      Returns: Whether the [gtk.aspect_frame.AspectFrame] should use the aspect ratio of its child.
  */
  @property bool obeyChild()
  {
    return getObeyChild();
  }

  /**
      Set `obeyChild` property.
      Params:
        propval = Whether the [gtk.aspect_frame.AspectFrame] should use the aspect ratio of its child.
  */
  @property void obeyChild(bool propval)
  {
    return setObeyChild(propval);
  }

  /**
      Get `ratio` property.
      Returns: The aspect ratio to be used by the [gtk.aspect_frame.AspectFrame].
        
        This property is only used if
        `property@Gtk.AspectFrame:obey-child` is set to false.
  */
  @property float ratio()
  {
    return getRatio();
  }

  /**
      Set `ratio` property.
      Params:
        propval = The aspect ratio to be used by the [gtk.aspect_frame.AspectFrame].
          
          This property is only used if
          `property@Gtk.AspectFrame:obey-child` is set to false.
  */
  @property void ratio(float propval)
  {
    return setRatio(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the child.
  */
  @property float xalign()
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the child.
  */
  @property void xalign(float propval)
  {
    return setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the child.
  */
  @property float yalign()
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the child.
  */
  @property void yalign(float propval)
  {
    return setYalign(propval);
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
  this(float xalign, float yalign, float ratio, bool obeyChild)
  {
    GtkWidget* _cretval;
    _cretval = gtk_aspect_frame_new(xalign, yalign, ratio, obeyChild);
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
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
  bool getObeyChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_aspect_frame_get_obey_child(cast(GtkAspectFrame*)this._cPtr);
    return _retval;
  }

  /**
      Returns the desired aspect ratio of the child.
      Returns: the desired aspect ratio
  */
  float getRatio()
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
  float getXalign()
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
  float getYalign()
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
  void setChild(gtk.widget.Widget child = null)
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
  void setObeyChild(bool obeyChild)
  {
    gtk_aspect_frame_set_obey_child(cast(GtkAspectFrame*)this._cPtr, obeyChild);
  }

  /**
      Sets the desired aspect ratio of the child.
  
      Params:
        ratio = aspect ratio of the child
  */
  void setRatio(float ratio)
  {
    gtk_aspect_frame_set_ratio(cast(GtkAspectFrame*)this._cPtr, ratio);
  }

  /**
      Sets the horizontal alignment of the child within the allocation
      of the [gtk.aspect_frame.AspectFrame].
  
      Params:
        xalign = horizontal alignment, from 0.0 (left aligned) to 1.0 (right aligned)
  */
  void setXalign(float xalign)
  {
    gtk_aspect_frame_set_xalign(cast(GtkAspectFrame*)this._cPtr, xalign);
  }

  /**
      Sets the vertical alignment of the child within the allocation
      of the [gtk.aspect_frame.AspectFrame].
  
      Params:
        yalign = horizontal alignment, from 0.0 (top aligned) to 1.0 (bottom aligned)
  */
  void setYalign(float yalign)
  {
    gtk_aspect_frame_set_yalign(cast(GtkAspectFrame*)this._cPtr, yalign);
  }
}
