/// Module for [ServerOperationNode] class
module gda.server_operation_node;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.server_operation_node.ServerOperationNode");

    _cInstance = *cast(GdaServerOperationNode*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.ServerOperationNodeType type()
  {
    return cast(gda.types.ServerOperationNodeType)(cast(GdaServerOperationNode*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.ServerOperationNodeType propval)
  {
    (cast(GdaServerOperationNode*)this._cPtr).type = cast(GdaServerOperationNodeType)propval;
  }

  /** */
  @property gda.types.ServerOperationNodeStatus status()
  {
    return cast(gda.types.ServerOperationNodeStatus)(cast(GdaServerOperationNode*)this._cPtr).status;
  }

  /** */
  @property void status(gda.types.ServerOperationNodeStatus propval)
  {
    (cast(GdaServerOperationNode*)this._cPtr).status = cast(GdaServerOperationNodeStatus)propval;
  }

  /** */
  @property gda.set.Set plist()
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).plist);
  }

  /** */
  @property void plist(gda.set.Set propval)
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).plist);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).plist);
  }

  /** */
  @property gda.data_model.DataModel model()
  {
    return cToD!(gda.data_model.DataModel)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).model);
  }

  /** */
  @property void model(gda.data_model.DataModel propval)
  {
    cValueFree!(gda.data_model.DataModel)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).model);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).model);
  }

  /** */
  @property gda.column.Column column()
  {
    return cToD!(gda.column.Column)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).column);
  }

  /** */
  @property void column(gda.column.Column propval)
  {
    cValueFree!(gda.column.Column)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).column);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).column);
  }

  /** */
  @property gda.holder.Holder param()
  {
    return cToD!(gda.holder.Holder)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).param);
  }

  /** */
  @property void param(gda.holder.Holder propval)
  {
    cValueFree!(gda.holder.Holder)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).param);
    dToC(propval, cast(void*)&(cast(GdaServerOperationNode*)this._cPtr).param);
  }
}
