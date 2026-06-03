/// Module for [DataModelDir] class
module gda.data_model_dir;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DataModelDir : gobject.object.ObjectWrap, gda.data_model.DataModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_data_model_dir_get_type != &gidSymbolNotFound ? gda_data_model_dir_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataModelDir self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gda.data_model_dir.DataModelDir]
      Returns: New builder object
  */
  static DataModelDirGidBuilder builder() nothrow
  {
    return new DataModelDirGidBuilder;
  }

  /** */
  @property string basedir() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("basedir");
  }

  mixin DataModelT!();

  /**
      Creates a new #GdaDataModel object to list all the files starting from basedir
  
      Params:
        basedir = a directory
      Returns: a new #GdaDataModel
  */
  static gda.data_model.DataModel new_(string basedir) nothrow
  {
    GdaDataModel* _cretval;
    const(char)* _basedir = basedir.toCString!(No.Malloc, No.Nullable);
    _cretval = gda_data_model_dir_new(_basedir);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Reset the list of errors which have occurred while using model
  */
  void cleanErrors() nothrow
  {
    gda_data_model_dir_clean_errors(cast(GdaDataModelDir*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gda.data_model_dir.DataModelDir]
class DataModelDirGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_model.DataModelGidBuilderImpl!T
{

  mixin DataModelGidBuilderT!();

  /** */
  T basedir(string propval) nothrow
  {
    return setProperty("basedir", propval);
  }
}

/// Fluent builder for [gda.data_model_dir.DataModelDir]
final class DataModelDirGidBuilder : DataModelDirGidBuilderImpl!DataModelDirGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataModelDir build() nothrow
  {
    return new DataModelDir(cast(void*)createGObject(DataModelDir._getGType), No.Take);
  }
}
