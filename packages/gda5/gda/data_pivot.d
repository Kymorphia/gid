/// Module for [DataPivot] class
module gda.data_pivot;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;

/** */
class DataPivot : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_pivot_get_type != &gidSymbolNotFound ? gda_data_pivot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataPivot self()
  {
    return this;
  }

  /** */
  @property gda.data_model.DataModel model()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("model");
  }

  /** */
  @property void model(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("model", propval);
  }

  mixin DataModelT!();

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_pivot_error_quark();
    return _retval;
  }

  /**
      Creates a new #GdaDataModel which will contain analysed data from model.
  
      Params:
        model = a #GdaDataModel to analyse data from, or null
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel new_(gda.data_model.DataModel model = null)
  {
    GdaDataModel* _cretval;
    _cretval = gda_data_pivot_new(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Specifies that field has to be included in the analysis.
      field is a field specification with the following accepted syntaxes:
      <itemizedlist>
        <listitem><para>a column name in the source data model (see <link linkend="gda-data-model-get-column-index">[gda.data_model.DataModel.getColumnIndex]</link>); or</para></listitem>
        <listitem><para>an SQL expression involving a column name in the source data model, for examples:
        <programlisting>
      price
      firstname || ' ' || lastname
      nb BETWEEN 5 AND 10</programlisting>
      </para></listitem>
      </itemizedlist>
      
      It is also possible to specify several fields to be added, while separating them by a comma (in effect
      still forming a valid SQL syntax).
  
      Params:
        aggregateType = the type of aggregate operation to perform
        field = the field description, see below
        alias_ = the field alias, or null
      Returns: true if no error occurred
      Throws: [DataPivotException]
  */
  bool addData(gda.types.DataPivotAggregate aggregateType, string field, string alias_ = null)
  {
    bool _retval;
    const(char)* _field = field.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_data_pivot_add_data(cast(GdaDataPivot*)this._cPtr, aggregateType, _field, _alias_, &_err);
    if (_err)
      throw new DataPivotException(_err);
    return _retval;
  }

  /**
      Specifies that field has to be included in the analysis.
      field is a field specification with the following accepted syntaxes:
      <itemizedlist>
        <listitem><para>a column name in the source data model (see <link linkend="gda-data-model-get-column-index">[gda.data_model.DataModel.getColumnIndex]</link>); or</para></listitem>
        <listitem><para>an SQL expression involving a column name in the source data model, for example:
        <programlisting>
      price
      firstname || ' ' || lastname
      nb BETWEEN 5 AND 10</programlisting>
      </para></listitem>
      </itemizedlist>
      
      It is also possible to specify several fields to be added, while separating them by a comma (in effect
      still forming a valid SQL syntax).
  
      Params:
        fieldType = the type of field to add
        field = the field description, see below
        alias_ = the field alias, or null
      Returns: true if no error occurred
      Throws: [DataPivotException]
  */
  bool addField(gda.types.DataPivotFieldType fieldType, string field, string alias_ = null)
  {
    bool _retval;
    const(char)* _field = field.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_data_pivot_add_field(cast(GdaDataPivot*)this._cPtr, fieldType, _field, _alias_, &_err);
    if (_err)
      throw new DataPivotException(_err);
    return _retval;
  }

  /**
      Acutally populates pivot by analysing the data from the provided data model.
      Returns: true if no error occurred.
      Throws: [DataPivotException]
  */
  bool populate()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_pivot_populate(cast(GdaDataPivot*)this._cPtr, &_err);
    if (_err)
      throw new DataPivotException(_err);
    return _retval;
  }
}

class DataPivotException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_pivot.DataPivot.errorQuark, cast(int)code, msg);
  }

  alias Code = DataPivotError;
}
