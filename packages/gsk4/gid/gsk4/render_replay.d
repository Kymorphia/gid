/// Module for [RenderReplay] class
module gid.gsk4.render_replay;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.texture;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;
import gid.pango1.font;

/**
    A facility to replay a [gid.gsk4.render_node.RenderNode] and its children, potentially
    modifying them.
    
    This is a utility tool to walk a rendernode tree. The most powerful way
    is to provide a function via [gid.gsk4.render_replay.RenderReplay.setNodeFilter]
    to filter each individual node and then run
    [gid.gsk4.render_replay.RenderReplay.filterNode] on the nodes you want to filter.
    
    If you want to just walk the node tree and extract information
    without any modifications, you can also use [gid.gsk4.render_node.RenderNode.getChildren].
    
    Here is a little example application that redacts text in a node file:
    
    ```
    #include <gtk/gtk.h>
    
    static GskRenderNode *
    redact_nodes (GskRenderReplay *replay,
                  GskRenderNode   *node,
                  gpointer         user_data)
    {
      GskRenderNode *result;
    
      if (gsk_render_node_get_node_type (node) == GSK_TEXT_NODE)
        {
          graphene_rect_t bounds;
          const GdkRGBA *color;
    
          gsk_render_node_get_bounds (node, &bounds);
          color = gsk_text_node_get_color (node);
    
          result = gsk_color_node_new (color, &bounds);
        }
      else
        {
          result = gsk_render_replay_default (replay, node);
        }
    
      return result;
    }
    
    int
    main (int argc, char *argv[])
    {
      GFile *file;
      GBytes *bytes;
      GskRenderNode *result, *node;
      GskRenderReplay *replay;
    
      gtk_init ();
    
      if (argc != 3)
        {
          g_print ("usage: %s INFILE OUTFILE\n", argv[0]);
          return 0;
        }
    
      file = g_file_new_for_commandline_arg (argv[1]);
      bytes = g_file_load_bytes (file, NULL, NULL, NULL);
      g_object_unref (file);
      if (bytes == NULL)
        return 1;
    
      node = gsk_render_node_deserialize (bytes, NULL, NULL);
      g_bytes_unref (bytes);
      if (node == NULL)
        return 1;
    
      replay = gsk_render_replay_new ();
      gsk_render_replay_set_node_filter (replay, redact_nodes, NULL, NULL);
      result = gsk_render_replay_filter_node (replay, node);
      gsk_render_replay_free (replay);
    
      if (!gsk_render_node_write_to_file (result, argv[2], NULL))
        return 1;
    
      gsk_render_node_unref (result);
      gsk_render_node_unref (node);
    
      return 0;
    }
    ```
*/
@gidGir("RenderReplay")
class RenderReplay : gid.gobject2.boxed.BoxedWrap!(gsk_render_replay_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override RenderReplay self() nothrow
  {
    return this;
  }

  /**
      Creates a new replay object to replay nodes.
      Returns: A new replay object to replay nodes
  */
  this() nothrow
  {
    GskRenderReplay* _cretval;
    _cretval = gsk_render_replay_new();
    this(_cretval, Yes.Take);
  }

  /**
      Replays the node using the default method.
      
      The default method calls [gid.gsk4.render_replay.RenderReplay.filterNode]
      on all its child nodes and the filter functions for all its
      properties. If none of them are changed, it returns the passed
      in node. Otherwise it constructs a new node with the changed
      children and properties.
      
      It may not be possible to construct a new node when any of the
      callbacks return NULL. In that case, this function will return
      NULL, too.
  
      Params:
        node = the node to replay
      Returns: The replayed node
  */
  gid.gsk4.render_node.RenderNode default_(gid.gsk4.render_node.RenderNode node) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_render_replay_default(cast(GskRenderReplay*)this._cPtr, node ? cast(GskRenderNode*)node._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Filters a font using the current filter function.
  
      Params:
        font = The font to filter
      Returns: the filtered font
  */
  gid.pango1.font.Font filterFont(gid.pango1.font.Font font) nothrow
  {
    PangoFont* _cretval;
    _cretval = gsk_render_replay_filter_font(cast(GskRenderReplay*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Replays a node using the replay's filter function.
      
      After the replay the node may be unchanged, or it may be
      removed, which will result in null being returned.
      
      If no filter node is set, [gid.gsk4.render_replay.RenderReplay.default_] is
      called instead.
  
      Params:
        node = the node to replay
      Returns: The replayed node
  */
  gid.gsk4.render_node.RenderNode filterNode(gid.gsk4.render_node.RenderNode node) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_render_replay_filter_node(cast(GskRenderReplay*)this._cPtr, node ? cast(GskRenderNode*)node._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Filters a texture using the current filter function.
  
      Params:
        texture = The texture to filter
      Returns: the filtered texture
  */
  gid.gdk4.texture.Texture filterTexture(gid.gdk4.texture.Texture texture) nothrow
  {
    GdkTexture* _cretval;
    _cretval = gsk_render_replay_filter_texture(cast(GskRenderReplay*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets a filter function to be called by [gid.gsk4.render_replay.RenderReplay.default_]
      for nodes that contain fonts.
      
      You can call `methodGskRenderReplay.filter_font` to filter
      a font yourself.
  
      Params:
        filter = the font filter function
  */
  void setFontFilter(gid.gsk4.types.RenderReplayFontFilter filter = null) nothrow
  {
    extern(C) PangoFont* _filterCallback(GskRenderReplay* replay, PangoFont* font, void* userData) nothrow
    {
      gidAttachThread();
      gid.pango1.font.Font _dretval;
      auto _dlg = cast(gid.gsk4.types.RenderReplayFontFilter*)userData;
      auto _replay = replay ? new gid.gsk4.render_replay.RenderReplay(cast(void*)replay, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(_replay, gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(void*)font, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gsk4.types.RenderReplayFontFilter");
      }
      auto _retval = _dretval ? cast(PangoFont*)_dretval._cPtr(Yes.Dup) : null;
      if (_replay)
        _replay._cUnborrow;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    gsk_render_replay_set_font_filter(cast(GskRenderReplay*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
  }

  /**
      Sets the function to use as a node filter.
      
      This is the most complex function to use for replaying nodes.
      It can either:
      
      * keep the node and just return it unchanged
      
      * create a replacement node and return that
      
      * discard the node by returning `NULL`
      
      * call [gid.gsk4.render_replay.RenderReplay.default_] to have the default handler
        run for this node, which calls your function on its children
  
      Params:
        filter = the function to call to replay nodes
  */
  void setNodeFilter(gid.gsk4.types.RenderReplayNodeFilter filter = null) nothrow
  {
    extern(C) GskRenderNode* _filterCallback(GskRenderReplay* replay, GskRenderNode* node, void* userData) nothrow
    {
      gidAttachThread();
      gid.gsk4.render_node.RenderNode _dretval;
      auto _dlg = cast(gid.gsk4.types.RenderReplayNodeFilter*)userData;
      auto _replay = replay ? new gid.gsk4.render_replay.RenderReplay(cast(void*)replay, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(_replay, node ? new gid.gsk4.render_node.RenderNode(cast(void*)node, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gsk4.types.RenderReplayNodeFilter");
      }
      auto _retval = _dretval ? cast(GskRenderNode*)_dretval._cPtr(Yes.Dup) : null;
      if (_replay)
        _replay._cUnborrow;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    gsk_render_replay_set_node_filter(cast(GskRenderReplay*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
  }

  /**
      Sets a filter function to be called by [gid.gsk4.render_replay.RenderReplay.default_]
      for nodes that contain textures.
      
      You can call `methodGskRenderReplay.filter_texture` to filter
      a texture yourself.
  
      Params:
        filter = the texture filter function
  */
  void setTextureFilter(gid.gsk4.types.RenderReplayTextureFilter filter = null) nothrow
  {
    extern(C) GdkTexture* _filterCallback(GskRenderReplay* replay, GdkTexture* texture, void* userData) nothrow
    {
      gidAttachThread();
      gid.gdk4.texture.Texture _dretval;
      auto _dlg = cast(gid.gsk4.types.RenderReplayTextureFilter*)userData;
      auto _replay = replay ? new gid.gsk4.render_replay.RenderReplay(cast(void*)replay, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(_replay, gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(void*)texture, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gsk4.types.RenderReplayTextureFilter");
      }
      auto _retval = _dretval ? cast(GdkTexture*)_dretval._cPtr(Yes.Dup) : null;
      if (_replay)
        _replay._cUnborrow;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    gsk_render_replay_set_texture_filter(cast(GskRenderReplay*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
  }
}
