/// Module for [DatasetFactory] class
module arrowdataset.dataset_factory;

public import gid.basictypes;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.finish_options;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class DatasetFactory : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_dataset_factory_get_type != &gidSymbolNotFound ? gadataset_dataset_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DatasetFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.dataset_factory.DatasetFactory]
      Returns: New builder object
  */
  static DatasetFactoryGidBuilder builder() nothrow
  {
    return new DatasetFactoryGidBuilder;
  }

  /** */
  arrowdataset.dataset.Dataset finish(arrowdataset.finish_options.FinishOptions options = null)
  {
    GADatasetDataset* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_factory_finish(cast(GADatasetDatasetFactory*)this._cPtr, options ? cast(GADatasetFinishOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.dataset.Dataset)(cast(GADatasetDataset*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowdataset.dataset_factory.DatasetFactory]
class DatasetFactoryGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T datasetFactory(void* propval) nothrow
  {
    return setProperty("dataset-factory", propval);
  }
}

/// Fluent builder for [arrowdataset.dataset_factory.DatasetFactory]
final class DatasetFactoryGidBuilder : DatasetFactoryGidBuilderImpl!DatasetFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DatasetFactory build() nothrow
  {
    return new DatasetFactory(cast(void*)createGObject(DatasetFactory._getGType), No.Take);
  }
}
