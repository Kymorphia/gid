/// Module for [ServerOperationNode] class
module gda.server_operation_node;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.column;
import gda.data_model;
import gda.holder;
import gda.set;
import gda.types;
import gid.gid;

/** */
class ServerOperationNode
{
  GdaServerOperationNode _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaServerOperationNode*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.ServerOperationNodeType type() nothrow
  {
    return cast(gda.types.ServerOperationNodeType)(cast(GdaServerOperationNode*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.ServerOperationNodeType propval) nothrow
  {
    (cast(GdaServerOperationNode*)this._cPtr).type = cast(GdaServerOperationNodeType)propval;
  }

  /** */
  @property gda.types.ServerOperationNodeStatus status() nothrow
  {
    return cast(gda.types.ServerOperationNodeStatus)(cast(GdaServerOperationNode*)this._cPtr).status;
  }

  /** */
  @property void status(gda.types.ServerOperationNodeStatus propval) nothrow
  {
    (cast(GdaServerOperationNode*)this._cPtr).status = cast(GdaServerOperationNodeStatus)propval;
  }

  /** */
  @property gda.set.Set plist() nothrow
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).plist);
  }

  /** */
  @property void plist(gda.set.Set propval) nothrow
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).plist);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).plist);
  }

  /** */
  @property gda.data_model.DataModel model() nothrow
  {
    return cToD!(gda.data_model.DataModel)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).model);
  }

  /** */
  @property void model(gda.data_model.DataModel propval) nothrow
  {
    cValueFree!(gda.data_model.DataModel)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).model);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).model);
  }

  /** */
  @property gda.column.Column column() nothrow
  {
    return cToD!(gda.column.Column)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).column);
  }

  /** */
  @property void column(gda.column.Column propval) nothrow
  {
    cValueFree!(gda.column.Column)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).column);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).column);
  }

  /** */
  @property gda.holder.Holder param() nothrow
  {
    return cToD!(gda.holder.Holder)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).param);
  }

  /** */
  @property void param(gda.holder.Holder propval) nothrow
  {
    cValueFree!(gda.holder.Holder)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).param);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).param);
  }
}
