/// Module for [HashJoinNodeOptions] class
module arrow.hash_join_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class HashJoinNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_hash_join_node_options_get_type != &gidSymbolNotFound ? garrow_hash_join_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HashJoinNodeOptions self()
  {
    return this;
  }

  /** */
  this(arrow.types.JoinType type, string[] leftKeys, string[] rightKeys)
  {
    GArrowHashJoinNodeOptions* _cretval;
    size_t _nLeftKeys;
    if (leftKeys)
      _nLeftKeys = cast(size_t)leftKeys.length;

    char*[] _tmpleftKeys;
    foreach (s; leftKeys)
      _tmpleftKeys ~= s.toCString(No.Alloc);
    const(char*)* _leftKeys = _tmpleftKeys.ptr;

    size_t _nRightKeys;
    if (rightKeys)
      _nRightKeys = cast(size_t)rightKeys.length;

    char*[] _tmprightKeys;
    foreach (s; rightKeys)
      _tmprightKeys ~= s.toCString(No.Alloc);
    const(char*)* _rightKeys = _tmprightKeys.ptr;

    GError *_err;
    _cretval = garrow_hash_join_node_options_new(type, _leftKeys, _nLeftKeys, _rightKeys, _nRightKeys, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool setLeftOutputs(string[] outputs)
  {
    bool _retval;
    size_t _nOutputs;
    if (outputs)
      _nOutputs = cast(size_t)outputs.length;

    char*[] _tmpoutputs;
    foreach (s; outputs)
      _tmpoutputs ~= s.toCString(No.Alloc);
    const(char*)* _outputs = _tmpoutputs.ptr;

    GError *_err;
    _retval = cast(bool)garrow_hash_join_node_options_set_left_outputs(cast(GArrowHashJoinNodeOptions*)this._cPtr, _outputs, _nOutputs, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool setRightOutputs(string[] outputs)
  {
    bool _retval;
    size_t _nOutputs;
    if (outputs)
      _nOutputs = cast(size_t)outputs.length;

    char*[] _tmpoutputs;
    foreach (s; outputs)
      _tmpoutputs ~= s.toCString(No.Alloc);
    const(char*)* _outputs = _tmpoutputs.ptr;

    GError *_err;
    _retval = cast(bool)garrow_hash_join_node_options_set_right_outputs(cast(GArrowHashJoinNodeOptions*)this._cPtr, _outputs, _nOutputs, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
