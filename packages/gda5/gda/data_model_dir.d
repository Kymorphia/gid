/// Module for [DataModelDir] class
module gda.data_model_dir;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.types;
import gid.gid;
import gobject.object;

/** */
class DataModelDir : gobject.object.ObjectWrap, gda.data_model.DataModel
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_data_model_dir_get_type != &gidSymbolNotFound ? gda_data_model_dir_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataModelDir self()
  {
    return this;
  }

  mixin DataModelT!();

  /**
      Creates a new #GdaDataModel object to list all the files starting from basedir
  
      Params:
        basedir = a directory
      Returns: a new #GdaDataModel
  */
  static gda.data_model.DataModel new_(string basedir)
  {
    GdaDataModel* _cretval;
    const(char)* _basedir = basedir.toCString(No.Alloc);
    _cretval = gda_data_model_dir_new(_basedir);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Reset the list of errors which have occurred while using model
  */
  void cleanErrors()
  {
    gda_data_model_dir_clean_errors(cast(GdaDataModelDir*)this._cPtr);
  }
}
