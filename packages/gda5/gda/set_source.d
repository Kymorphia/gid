/// Module for [SetSource] class
module gda.set_source;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.set_node;
import gda.types;
import gid.gid;
import gobject.boxed;
import gobject.object;

/**
    Since 5.2, you must consider this struct as opaque. Any access to its internal must use public API.
    Don't try to use #gda_set_source_free on a struct that was created manually.
*/
class SetSource : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_set_source_get_type != &gidSymbolNotFound ? gda_set_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SetSource self() nothrow
  {
    return this;
  }

  /**
      Get `dataModel` field.
      Returns: Can't be NULL
  */
  @property gda.data_model.DataModel dataModel() nothrow
  {
    return cToD!(gda.data_model.DataModel)(cast(void*)(cast(GdaSetSource*)this._cPtr).dataModel);
  }

  /**
      Set `dataModel` field.
      Params:
        propval = Can't be NULL
  */
  @property void dataModel(gda.data_model.DataModel propval) nothrow
  {
    cValueFree!(gda.data_model.DataModel)(cast(void*)(cast(GdaSetSource*)this._cPtr).dataModel);
    dToC(propval, cast(void*)&(cast(GdaSetSource*)this._cPtr).dataModel);
  }

  /**
      Creates a new #GdaSetSource struct.
  
      Params:
        model = a #GdaDataModel
      Returns: a new #GdaSetSource struct.
  */
  this(gda.data_model.DataModel model) nothrow
  {
    GdaSetSource* _cretval;
    _cretval = gda_set_source_new(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Set a #GdaDataModel
  
      Params:
        node = a #GdaSetNode to add
  */
  void addNode(gda.set_node.SetNode node) nothrow
  {
    gda_set_source_add_node(cast(GdaSetSource*)this._cPtr, node ? cast(GdaSetNode*)node._cPtr(No.Dup) : null);
  }

  /**
      Copy constructor.
      Returns: a new #GdaSetSource
  */
  gda.set_source.SetSource copy() nothrow
  {
    GdaSetSource* _cretval;
    _cretval = gda_set_source_copy(cast(GdaSetSource*)this._cPtr);
    auto _retval = _cretval ? new gda.set_source.SetSource(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gda.data_model.DataModel getDataModel() nothrow
  {
    GdaDataModel* _cretval;
    _cretval = gda_set_source_get_data_model(cast(GdaSetSource*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, No.Take);
    return _retval;
  }

  /** */
  int getNNodes() nothrow
  {
    int _retval;
    _retval = gda_set_source_get_n_nodes(cast(GdaSetSource*)this._cPtr);
    return _retval;
  }

  /** */
  gda.set_node.SetNode[] getNodes() nothrow
  {
    GSList* _cretval;
    _cretval = gda_set_source_get_nodes(cast(GdaSetSource*)this._cPtr);
    auto _retval = gSListToD!(gda.set_node.SetNode, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Set a #GdaDataModel
  
      Params:
        model = a #GdaDataModel
  */
  void setDataModel(gda.data_model.DataModel model) nothrow
  {
    gda_set_source_set_data_model(cast(GdaSetSource*)this._cPtr, model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}
