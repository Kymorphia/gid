/// Module for [ColorMatrixNode] class
module gid.gsk4.color_matrix_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.matrix;
import gid.graphene1.vec4;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node controlling the color matrix of its single child node.
*/
class ColorMatrixNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_color_matrix_node_get_type != &gidSymbolNotFound ? gsk_color_matrix_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will drawn the child with
      color_matrix.
      
      In particular, the node will transform colors by applying
      
          pixel = transpose(color_matrix) * pixel + color_offset
      
      for every pixel. The transformation operates on unpremultiplied
      colors, with color components ordered R, G, B, A.
  
      Params:
        child = The node to draw
        colorMatrix = The matrix to apply
        colorOffset = Values to add to the color
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.render_node.RenderNode child, gid.graphene1.matrix.Matrix colorMatrix, gid.graphene1.vec4.Vec4 colorOffset) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_matrix_node_new(child ? cast(GskRenderNode*)child._cPtr(No.Dup) : null, colorMatrix ? cast(const(graphene_matrix_t)*)colorMatrix._cPtr(No.Dup) : null, colorOffset ? cast(const(graphene_vec4_t)*)colorOffset._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the child node that is getting its colors modified by the given node.
      Returns: The child that is getting its colors modified
  */
  gid.gsk4.render_node.RenderNode getChild() nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_matrix_node_get_child(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the color matrix used by the node.
      Returns: a 4x4 color matrix
  */
  gid.graphene1.matrix.Matrix getColorMatrix() nothrow
  {
    const(graphene_matrix_t)* _cretval;
    _cretval = gsk_color_matrix_node_get_color_matrix(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.graphene1.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the color offset used by the node.
      Returns: a color vector
  */
  gid.graphene1.vec4.Vec4 getColorOffset() nothrow
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = gsk_color_matrix_node_get_color_offset(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.graphene1.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
