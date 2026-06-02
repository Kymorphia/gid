/// Module for [ColorMatrixNode] class
module gsk.color_matrix_node;

public import gid.basictypes;
import gid.gid;
import graphene.matrix;
import graphene.vec4;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node controlling the color matrix of its single child node.
*/
class ColorMatrixNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will drawn the child with
      color_matrix.
      
      In particular, the node will transform colors by applying
      
          pixel = transpose(color_matrix) * pixel + color_offset
      
      for every pixel. The transformation operates on unpremultiplied
      colors, with color components ordered R, G, B, A.
  
      Params:
        child = The node to draw
        colorMatrix = The matrix to apply
        colorOffset = Values to add to the color
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.render_node.RenderNode child, graphene.matrix.Matrix colorMatrix, graphene.vec4.Vec4 colorOffset) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_matrix_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, colorMatrix ? cast(const(graphene_matrix_t)*)colorMatrix._cPtr(No.Dup) : null, colorOffset ? cast(const(graphene_vec4_t)*)colorOffset._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting its colors modified by the given node.
      Returns: The child that is getting its colors modified
  */
  gsk.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_matrix_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the color matrix used by the node.
      Returns: a 4x4 color matrix
  */
  graphene.matrix.Matrix getColorMatrix() nothrow
  {
    const(graphene_matrix_t)* _cretval;
    _cretval = gsk_color_matrix_node_get_color_matrix(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the color offset used by the node.
      Returns: a color vector
  */
  graphene.vec4.Vec4 getColorOffset() nothrow
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = gsk_color_matrix_node_get_color_offset(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
