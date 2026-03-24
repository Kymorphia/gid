/// Module for [GraphicsOffload] class
module gtk.graphics_offload;

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
    A widget that allows to bypass gsk rendering for its child by passing the content
    directly to the compositor.
    
    Graphics offload is an optimization to reduce overhead and battery use that is
    most useful for video content. It only works on some platforms and in certain
    situations. GTK will automatically fall back to normal rendering if it doesn't.
    
    Graphics offload is most efficient if there are no controls drawn on top of the
    video content.
    
    You should consider using graphics offload for your main widget if it shows
    frequently changing content (such as a video, or a VM display) and you provide
    the content in the form of dmabuf textures (see [gdk.dmabuf_texture_builder.DmabufTextureBuilder]),
    in particular if it may be fullscreen.
    
    Numerous factors can prohibit graphics offload:
    
    $(LIST
      * Unsupported platforms. Currently, graphics offload only works on Linux with Wayland.
      
      * Clipping, such as rounded corners that cause the video content to not be rectangular
      
      * Unsupported dmabuf formats (see [gdk.display.Display.getDmabufFormats])
      
      * Translucent video content (content with an alpha channel, even if it isn't used)
      
      * Transforms that are more complex than translations and scales
      
      * Filters such as opacity, grayscale or similar
    )
      
    To investigate problems related graphics offload, GTK offers debug flags to print
    out information about graphics offload and dmabuf use:
    
        GDK_DEBUG=offload
        GDK_DEBUG=dmabuf
    
    The GTK inspector provides a visual debugging tool for graphics offload.
*/
class GraphicsOffload : gtk.widget.Widget
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
    return cast(void function())gtk_graphics_offload_get_type != &gidSymbolNotFound ? gtk_graphics_offload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GraphicsOffload self()
  {
    return this;
  }

  /**
  Get builder for [gtk.graphics_offload.GraphicsOffload]
  Returns: New builder object
  */
  static GraphicsOffloadGidBuilder builder()
  {
    return new GraphicsOffloadGidBuilder;
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
      Get `enabled` property.
      Returns: Whether graphics offload is enabled.
  */
  @property gtk.types.GraphicsOffloadEnabled enabled()
  {
    return getEnabled();
  }

  /**
      Set `enabled` property.
      Params:
        propval = Whether graphics offload is enabled.
  */
  @property void enabled(gtk.types.GraphicsOffloadEnabled propval)
  {
    setEnabled(propval);
  }

  /**
      Creates a new GtkGraphicsOffload widget.
  
      Params:
        child = the child widget
      Returns: the new widget
  */
  this(gtk.widget.Widget child = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_graphics_offload_new(child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child of self.
      Returns: the child widget
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_graphics_offload_get_child(cast(GtkGraphicsOffload*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether offload is enabled for self.
      Returns: whether offload is enabled
  */
  gtk.types.GraphicsOffloadEnabled getEnabled()
  {
    GtkGraphicsOffloadEnabled _cretval;
    _cretval = gtk_graphics_offload_get_enabled(cast(GtkGraphicsOffload*)this._cPtr);
    gtk.types.GraphicsOffloadEnabled _retval = cast(gtk.types.GraphicsOffloadEnabled)_cretval;
    return _retval;
  }

  /**
      Sets the child of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_graphics_offload_set_child(cast(GtkGraphicsOffload*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether this GtkGraphicsOffload widget will attempt
      to offload the content of its child widget.
  
      Params:
        enabled = whether to enable offload
  */
  void setEnabled(gtk.types.GraphicsOffloadEnabled enabled)
  {
    gtk_graphics_offload_set_enabled(cast(GtkGraphicsOffload*)this._cPtr, enabled);
  }
}

class GraphicsOffloadGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
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
      Set `enabled` property.
      Params:
        propval = Whether graphics offload is enabled.
      Returns: Builder instance for fluent chaining
  */
  T enabled(gtk.types.GraphicsOffloadEnabled propval)
  {
    return setProperty("enabled", propval);
  }
}

/// Fluent builder for [gtk.graphics_offload.GraphicsOffload]
final class GraphicsOffloadGidBuilder : GraphicsOffloadGidBuilderImpl!GraphicsOffloadGidBuilder
{
  GraphicsOffload build()
  {
    return new GraphicsOffload(cast(void*)createGObject(GraphicsOffload._getGType), Yes.Take);
  }
}
