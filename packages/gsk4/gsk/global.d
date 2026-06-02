/// Global functions for gsk4 library
module gsk.global;

import gid.gid;
import gobject.value;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;


/**
    Retrieves the [gsk.render_node.RenderNode] stored inside the given `value`, and acquires
    a reference to it.

    Params:
      value = a [gobject.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
    Returns: a [gsk.render_node.RenderNode]
*/
gsk.render_node.RenderNode valueDupRenderNode(gobject.value.Value value) nothrow
{
  GskRenderNode* _cretval;
  _cretval = gsk_value_dup_render_node(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Retrieves the [gsk.render_node.RenderNode] stored inside the given `value`.

    Params:
      value = a [gobject.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
    Returns: a [gsk.render_node.RenderNode]
*/
gsk.render_node.RenderNode valueGetRenderNode(gobject.value.Value value) nothrow
{
  GskRenderNode* _cretval;
  _cretval = gsk_value_get_render_node(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Stores the given [gsk.render_node.RenderNode] inside `value`.
    
    The [gobject.value.Value] will acquire a reference to the `node`.

    Params:
      value = a [gobject.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
      node = a [gsk.render_node.RenderNode]
*/
void valueSetRenderNode(gobject.value.Value value, gsk.render_node.RenderNode node) nothrow
{
  gsk_value_set_render_node(value ? cast(GValue*)value._cPtr(No.Dup) : null, node ? cast(GskRenderNode*)node._cPtr(No.Dup) : null);
}

/**
    Stores the given [gsk.render_node.RenderNode] inside `value`.
    
    This function transfers the ownership of the `node` to the [gobject.value.Value].

    Params:
      value = a [gobject.value.Value] initialized with type `GSK_TYPE_RENDER_NODE`
      node = a [gsk.render_node.RenderNode]
*/
void valueTakeRenderNode(gobject.value.Value value, gsk.render_node.RenderNode node = null) nothrow
{
  gsk_value_take_render_node(value ? cast(GValue*)value._cPtr(No.Dup) : null, node ? cast(GskRenderNode*)node._cPtr(Yes.Dup) : null);
}
