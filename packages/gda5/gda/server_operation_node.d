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
import gobject.object;

/** */
class ServerOperationNode
{
  GdaServerOperationNode _cInstance;

  /**
      Create a `server_operation_node.ServerOperationNode` wrap type.
      Params:
        type = 
        status = 
        plist = 
        model = 
        column = 
        param = 
  */
  this(gda.types.ServerOperationNodeType type = gda.types.ServerOperationNodeType.init, gda.types.ServerOperationNodeStatus status = gda.types.ServerOperationNodeStatus.init, gda.set.Set plist = gda.set.Set.init, gda.data_model.DataModel model = gda.data_model.DataModel.init, gda.column.Column column = gda.column.Column.init, gda.holder.Holder param = gda.holder.Holder.init) nothrow
  {
    this.type = type;
    this.status = status;
    this.plist = plist;
    this.model = model;
    this.column = column;
    this.param = param;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaServerOperationNode*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
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

  private gda.set.Set _plistRef; // Keeps borrowed field value alive

  /** */
  @property gda.set.Set plist() nothrow
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).plist);
  }

  /** */
  @property void plist(gda.set.Set propval) nothrow
  {
    _plistRef = propval;
    (cast(GdaServerOperationNode*)this._cPtr).plist = propval ? cast(GdaSet*)propval._cPtr(No.Dup) : null;
  }

  private gda.data_model.DataModel _modelRef; // Keeps borrowed field value alive

  /** */
  @property gda.data_model.DataModel model() nothrow
  {
    return cToD!(gda.data_model.DataModel)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).model);
  }

  /** */
  @property void model(gda.data_model.DataModel propval) nothrow
  {
    _modelRef = propval;
    (cast(GdaServerOperationNode*)this._cPtr).model = propval ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)propval)._cPtr(No.Dup) : null;
  }

  private gda.column.Column _columnRef; // Keeps borrowed field value alive

  /** */
  @property gda.column.Column column() nothrow
  {
    return cToD!(gda.column.Column)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).column);
  }

  /** */
  @property void column(gda.column.Column propval) nothrow
  {
    _columnRef = propval;
    (cast(GdaServerOperationNode*)this._cPtr).column = propval ? cast(GdaColumn*)propval._cPtr(No.Dup) : null;
  }

  private gda.holder.Holder _paramRef; // Keeps borrowed field value alive

  /** */
  @property gda.holder.Holder param() nothrow
  {
    return cToD!(gda.holder.Holder)(cast(void*)(cast(GdaServerOperationNode*)this._cPtr).param);
  }

  /** */
  @property void param(gda.holder.Holder propval) nothrow
  {
    _paramRef = propval;
    (cast(GdaServerOperationNode*)this._cPtr).param = propval ? cast(GdaHolder*)propval._cPtr(No.Dup) : null;
  }
}
