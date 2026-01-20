/// Module for [SetNode] class
module gda.set_node;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.holder;
import gda.types;
import gid.gid;
import gobject.boxed;
import gobject.object;

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_node_free on a struct that was created manually.
*/
class SetNode : gobject.boxed.Boxed
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
    return cast(void function())gda_set_node_get_type != &gidSymbolNotFound ? gda_set_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SetNode self()
  {
    return this;
  }

  /**
      Get `holder` field.
      Returns: a #GdaHolder. It can't be NULL
  */
  @property gda.holder.Holder holder()
  {
    return cToD!(gda.holder.Holder)(cast(void*)(cast(GdaSetNode*)this._cPtr).holder);
  }

  /**
      Set `holder` field.
      Params:
        propval = a #GdaHolder. It can't be NULL
  */
  @property void holder(gda.holder.Holder propval)
  {
    cValueFree!(gda.holder.Holder)(cast(void*)(cast(GdaSetNode*)this._cPtr).holder);
    dToC(propval, cast(void*)&(cast(GdaSetNode*)this._cPtr).holder);
  }

  /**
      Get `sourceModel` field.
      Returns: a #GdaDataModel. It could be NULL
  */
  @property gda.data_model.DataModel sourceModel()
  {
    return cToD!(gda.data_model.DataModel)(cast(void*)(cast(GdaSetNode*)this._cPtr).sourceModel);
  }

  /**
      Set `sourceModel` field.
      Params:
        propval = a #GdaDataModel. It could be NULL
  */
  @property void sourceModel(gda.data_model.DataModel propval)
  {
    cValueFree!(gda.data_model.DataModel)(cast(void*)(cast(GdaSetNode*)this._cPtr).sourceModel);
    dToC(propval, cast(void*)&(cast(GdaSetNode*)this._cPtr).sourceModel);
  }

  /**
      Get `sourceColumn` field.
      Returns: a #gint with the number of column in @source_model
  */
  @property int sourceColumn()
  {
    return (cast(GdaSetNode*)this._cPtr).sourceColumn;
  }

  /**
      Set `sourceColumn` field.
      Params:
        propval = a #gint with the number of column in @source_model
  */
  @property void sourceColumn(int propval)
  {
    (cast(GdaSetNode*)this._cPtr).sourceColumn = propval;
  }

  /**
      Creates a new #GdaSetNode struct.
  
      Params:
        holder = a #GdaHolder to used by new #GdaSetNode
      Returns: a new #GdaSetNode struct.
  */
  this(gda.holder.Holder holder)
  {
    GdaSetNode* _cretval;
    _cretval = gda_set_node_new(holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Copy constructor.
      Returns: a new #GdaSetNode
  */
  gda.set_node.SetNode copy()
  {
    GdaSetNode* _cretval;
    _cretval = gda_set_node_copy(cast(GdaSetNode*)this._cPtr);
    auto _retval = _cretval ? new gda.set_node.SetNode(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gda.data_model.DataModel getDataModel()
  {
    GdaDataModel* _cretval;
    _cretval = gda_set_node_get_data_model(cast(GdaSetNode*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gda.holder.Holder getHolder()
  {
    GdaHolder* _cretval;
    _cretval = gda_set_node_get_holder(cast(GdaSetNode*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  int getSourceColumn()
  {
    int _retval;
    _retval = gda_set_node_get_source_column(cast(GdaSetNode*)this._cPtr);
    return _retval;
  }

  /**
      Set a #GdaDataModel to be used by node. model increment its reference
      counting when set. Internally referenced column number is set to first column
      in model.
  
      Params:
        model = a #GdaDataModel to be used by node
  */
  void setDataModel(gda.data_model.DataModel model = null)
  {
    gda_set_node_set_data_model(cast(GdaSetNode*)this._cPtr, model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Set a #GdaHolder to node.
  
      Params:
        holder = 
  */
  void setHolder(gda.holder.Holder holder)
  {
    gda_set_node_set_holder(cast(GdaSetNode*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
  }

  /**
      Set column number in the #GdaDataModel used node. If no #GdaDataModel is set
      then column is set to invalid (-1);
  
      Params:
        column = 
  */
  void setSourceColumn(int column)
  {
    gda_set_node_set_source_column(cast(GdaSetNode*)this._cPtr, column);
  }
}
