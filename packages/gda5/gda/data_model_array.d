/// Module for [DataModelArray] class
module gda.data_model_array;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.row;
import gda.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class DataModelArray : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_model_array_get_type != &gidSymbolNotFound ? gda_data_model_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataModelArray self()
  {
    return this;
  }

  /**
      Get builder for [gda.data_model_array.DataModelArray]
      Returns: New builder object
  */
  static DataModelArrayGidBuilder builder()
  {
    return new DataModelArrayGidBuilder;
  }

  /** */
  @property uint nColumns()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-columns");
  }

  /** */
  @property void nColumns(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("n-columns", propval);
  }

  /** */
  @property bool readOnly()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("read-only");
  }

  /** */
  @property void readOnly(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("read-only", propval);
  }

  mixin DataModelT!();

  /**
      Creates a new #GdaDataModel object without initializing the column
      types. Using [gda.data_model_array.DataModelArray.newWithGTypes] is usually better.
  
      Params:
        cols = number of columns for rows in this data model.
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel new_(int cols)
  {
    GdaDataModel* _cretval;
    _cretval = gda_data_model_array_new(cols);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Frees all the rows in model.
  */
  void clear()
  {
    gda_data_model_array_clear(cast(GdaDataModelArray*)this._cPtr);
  }

  /**
      Get a pointer to a row in model
  
      Params:
        row = row number (starting from 0)
      Returns: the #GdaRow, or null if an error occurred
      Throws: [ErrorWrap]
  */
  gda.row.Row getRow(int row)
  {
    GdaRow* _cretval;
    GError *_err;
    _cretval = gda_data_model_array_get_row(cast(GdaDataModelArray*)this._cPtr, row, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.row.Row)(cast(GdaRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the number of columns for rows inserted in this model.
      cols must be greated than or equal to 0.
      
      Also clears model's contents.
  
      Params:
        cols = number of columns for rows this data model should use.
  */
  void setNColumns(int cols)
  {
    gda_data_model_array_set_n_columns(cast(GdaDataModelArray*)this._cPtr, cols);
  }
}

/// Fluent builder implementation template for [gda.data_model_array.DataModelArray]
class DataModelArrayGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.data_model.DataModelGidBuilderImpl!T
{

  mixin DataModelGidBuilderT!();

  /** */
  T nColumns(uint propval)
  {
    return setProperty("n-columns", propval);
  }

  /** */
  T readOnly(bool propval)
  {
    return setProperty("read-only", propval);
  }
}

/// Fluent builder for [gda.data_model_array.DataModelArray]
final class DataModelArrayGidBuilder : DataModelArrayGidBuilderImpl!DataModelArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataModelArray build()
  {
    return new DataModelArray(cast(void*)createGObject(DataModelArray._getGType), No.Take);
  }
}
