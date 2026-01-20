/// Module for [SetGroup] class
module gda.set_group;

import gda.c.functions;
import gda.c.types;
import gda.set_node;
import gda.set_source;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_group_free on a struct that was created manually.
*/
class SetGroup : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_set_group_get_type != &gidSymbolNotFound ? gda_set_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SetGroup self()
  {
    return this;
  }

  /**
      Get `nodesSource` field.
      Returns: if NULL, then @nodes contains exactly one entry
  */
  @property gda.set_source.SetSource nodesSource()
  {
    return cToD!(gda.set_source.SetSource)(cast(void*)(cast(GdaSetGroup*)this._cPtr).nodesSource);
  }

  /**
      Set `nodesSource` field.
      Params:
        propval = if NULL, then @nodes contains exactly one entry
  */
  @property void nodesSource(gda.set_source.SetSource propval)
  {
    cValueFree!(gda.set_source.SetSource)(cast(void*)(cast(GdaSetGroup*)this._cPtr).nodesSource);
    dToC(propval, cast(void*)&(cast(GdaSetGroup*)this._cPtr).nodesSource);
  }

  /**
      Creates a new #GdaSetGroup struct. If source is null then new group contains
      just one #GdaSetNode.
  
      Params:
        node = a #GdaSetNode struct
      Returns: a new #GdaSetGroup struct.
  */
  this(gda.set_node.SetNode node)
  {
    GdaSetGroup* _cretval;
    _cretval = gda_set_group_new(node ? cast(GdaSetNode*)node._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  void addNode(gda.set_node.SetNode node)
  {
    gda_set_group_add_node(cast(GdaSetGroup*)this._cPtr, node ? cast(GdaSetNode*)node._cPtr(No.Dup) : null);
  }

  /**
      Copy constructor.
      Returns: a new #GdaSetGroup
  */
  gda.set_group.SetGroup copy()
  {
    GdaSetGroup* _cretval;
    _cretval = gda_set_group_copy(cast(GdaSetGroup*)this._cPtr);
    auto _retval = _cretval ? new gda.set_group.SetGroup(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  int getNNodes()
  {
    int _retval;
    _retval = gda_set_group_get_n_nodes(cast(GdaSetGroup*)this._cPtr);
    return _retval;
  }

  /**
      This method always return first #GdaSetNode in sg.
      Returns: first #GdaSetNode in sg.
  */
  gda.set_node.SetNode getNode()
  {
    GdaSetNode* _cretval;
    _cretval = gda_set_group_get_node(cast(GdaSetGroup*)this._cPtr);
    auto _retval = _cretval ? new gda.set_node.SetNode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GSList with the #GdaSetNode grouped by sg. You must use
      #g_slist_free on returned list.
      Returns: a #GSList with all nodes in sg.
  */
  gda.set_node.SetNode[] getNodes()
  {
    GSList* _cretval;
    _cretval = gda_set_group_get_nodes(cast(GdaSetGroup*)this._cPtr);
    auto _retval = gSListToD!(gda.set_node.SetNode, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /** */
  gda.set_source.SetSource getSource()
  {
    GdaSetSource* _cretval;
    _cretval = gda_set_group_get_source(cast(GdaSetGroup*)this._cPtr);
    auto _retval = _cretval ? new gda.set_source.SetSource(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void setSource(gda.set_source.SetSource source)
  {
    gda_set_group_set_source(cast(GdaSetGroup*)this._cPtr, source ? cast(GdaSetSource*)source._cPtr(No.Dup) : null);
  }
}
