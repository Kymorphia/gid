/// Global functions for gsk4 library
module gid.gsk4.global;

import gid.core.gid;
import gid.gobject2.value;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;


/**
    Retrieves the render node stored inside a [gid.gobject2.value.Value],
    and acquires a reference to it.

    Params:
      value = a [gid.gobject2.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
    Returns: the render node
*/
gid.gsk4.render_node.RenderNode valueDupRenderNode(gid.gobject2.value.Value value) nothrow
{
  GskRenderNode* _cretval;
  _cretval = gsk_value_dup_render_node(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Retrieves the render node stored inside a [gid.gobject2.value.Value].

    Params:
      value = a [gid.gobject2.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
    Returns: the render node
*/
gid.gsk4.render_node.RenderNode valueGetRenderNode(gid.gobject2.value.Value value) nothrow
{
  GskRenderNode* _cretval;
  _cretval = gsk_value_get_render_node(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Stores the given render node inside a [gid.gobject2.value.Value].
    
    The [gid.gobject2.value.Value] will acquire a reference
    to the render node.

    Params:
      value = a [gid.gobject2.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
      node = a render node
*/
void valueSetRenderNode(gid.gobject2.value.Value value, gid.gsk4.render_node.RenderNode node) nothrow
{
  gsk_value_set_render_node(value ? cast(GValue*)value._cPtr(No.Dup) : null, node ? cast(GskRenderNode*)node._cPtr(No.Dup) : null);
}

/**
    Stores the given render node inside a [gid.gobject2.value.Value].
    
    This function transfers the ownership of the
    render node to the [gid.gobject2.value.Value].

    Params:
      value = a [gid.gobject2.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
      node = a render node
*/
void valueTakeRenderNode(gid.gobject2.value.Value value, gid.gsk4.render_node.RenderNode node = null) nothrow
{
  gsk_value_take_render_node(value ? cast(GValue*)value._cPtr(No.Dup) : null, node ? cast(GskRenderNode*)node._cPtr(Yes.Dup) : null);
}
