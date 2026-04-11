/// Module for [AspectFrame] class
module gtk.aspect_frame;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.frame;
import gtk.types;

/**
    The #GtkAspectFrame is useful when you want
    pack a widget so that it can resize but always retains
    the same aspect ratio. For instance, one might be
    drawing a small preview of a larger image. #GtkAspectFrame
    derives from #GtkFrame, so it can draw a label and
    a frame around the child. The frame will be
    “shrink-wrapped” to the size of the child.
    
    # CSS nodes
    
    GtkAspectFrame uses a CSS node with name frame.
*/
class AspectFrame : gtk.frame.Frame
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
      Get builder for [gtk.aspect_frame.AspectFrame]
      Returns: New builder object
  */
  static AspectFrameGidBuilder builder()
  {
    return new AspectFrameGidBuilder;
  }

  /** */
  @property bool obeyChild()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("obey-child");
  }

  /** */
  @property void obeyChild(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("obey-child", propval);
  }

  /** */
  @property float ratio()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("ratio");
  }

  /** */
  @property void ratio(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("ratio", propval);
  }

  /** */
  @property float xalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /** */
  @property void xalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /** */
  @property float yalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /** */
  @property void yalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /**
      Create a new #GtkAspectFrame.
  
      Params:
        label = Label text.
        xalign = Horizontal alignment of the child within the allocation of
           the #GtkAspectFrame. This ranges from 0.0 (left aligned)
           to 1.0 (right aligned)
        yalign = Vertical alignment of the child within the allocation of
           the #GtkAspectFrame. This ranges from 0.0 (top aligned)
           to 1.0 (bottom aligned)
        ratio = The desired aspect ratio.
        obeyChild = If true, ratio is ignored, and the aspect
           ratio is taken from the requistion of the child.
      Returns: the new #GtkAspectFrame.
  */
  this(string label, float xalign, float yalign, float ratio, bool obeyChild)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_aspect_frame_new(_label, xalign, yalign, ratio, obeyChild);
    this(_cretval, No.Take);
  }

  /**
      Set parameters for an existing #GtkAspectFrame.
  
      Params:
        xalign = Horizontal alignment of the child within the allocation of
           the #GtkAspectFrame. This ranges from 0.0 (left aligned)
           to 1.0 (right aligned)
        yalign = Vertical alignment of the child within the allocation of
           the #GtkAspectFrame. This ranges from 0.0 (top aligned)
           to 1.0 (bottom aligned)
        ratio = The desired aspect ratio.
        obeyChild = If true, ratio is ignored, and the aspect
           ratio is taken from the requistion of the child.
  */
  void set(float xalign, float yalign, float ratio, bool obeyChild)
  {
    gtk_aspect_frame_set(cast(GtkAspectFrame*)this._cPtr, xalign, yalign, ratio, obeyChild);
  }
}

/// Fluent builder implementation template for [gtk.aspect_frame.AspectFrame]
class AspectFrameGidBuilderImpl(T) : gtk.frame.FrameGidBuilderImpl!T
{


  /** */
  T obeyChild(bool propval)
  {
    return setProperty("obey-child", propval);
  }

  /** */
  T ratio(float propval)
  {
    return setProperty("ratio", propval);
  }

  /** */
  T xalign(float propval)
  {
    return setProperty("xalign", propval);
  }

  /** */
  T yalign(float propval)
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
  AspectFrame build()
  {
    return new AspectFrame(cast(void*)createGObject(AspectFrame._getGType), No.Take);
  }
}
