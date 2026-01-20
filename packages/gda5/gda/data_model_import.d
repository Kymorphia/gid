/// Module for [DataModelImport] class
module gda.data_model_import;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.set;
import gda.types;
import gid.gid;
import gobject.object;
import libxml2.types;

/** */
class DataModelImport : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_model_import_get_type != &gidSymbolNotFound ? gda_data_model_import_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataModelImport self()
  {
    return this;
  }

  /**
      Get `strict` property.
      Returns: Defines the behaviour in case the imported data contains recoverable errors (usually too
        many or too few data per row). If set to true, an error will be reported and the import
        will stop, and if set to false, then the error will be reported but the import will not stop.
  */
  @property bool strict()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strict");
  }

  /**
      Set `strict` property.
      Params:
        propval = Defines the behaviour in case the imported data contains recoverable errors (usually too
          many or too few data per row). If set to true, an error will be reported and the import
          will stop, and if set to false, then the error will be reported but the import will not stop.
  */
  @property void strict(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strict", propval);
  }

  mixin DataModelT!();

  /**
      Creates a new #GdaDataModel object which contains the data stored within the filename file.
      
      The options are the following ones:
      <itemizedlist>
        <listitem><para>For the CSV format:
           <itemizedlist>
              <listitem><para>ENCODING (string): specifies the encoding of the data in the file</para></listitem>
              <listitem><para>SEPARATOR (string): specifies the CSV separator (comma as default)</para></listitem>
              <listitem><para>QUOTE (string): specifies the character used as quote (double quote as default)</para></listitem>
              <listitem><para>NAMES_ON_FIRST_LINE (boolean): consider that the first line of the file contains columns' titles (note that the TITLE_AS_FIRST_LINE option is also accepted as a synonym)</para></listitem>
              <listitem><para>G_TYPE_&lt;column number&gt; (GType): specifies the type of value expected in column &lt;column number&gt;</para></listitem>
           </itemizedlist>
        </para></listitem>
        <listitem><para>Other formats: no option</para></listitem>
      </itemizedlist>
      
      Note: after the creation, please use [gda.data_model_import.DataModelImport.getErrors] to check any error.
  
      Params:
        filename = the file to import data from
        randomAccess = TRUE if random access will be required
        options = importing options
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel newFile(string filename, bool randomAccess, gda.set.Set options = null)
  {
    GdaDataModel* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gda_data_model_import_new_file(_filename, randomAccess, options ? cast(GdaSet*)options._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaDataModel object which contains the data stored in the data string.
      
      Important note: the data string is not copied for memory efficiency reasons and should not
      therefore be altered in any way as long as the returned data model exists.
  
      Params:
        data = a string containing the data to import
        randomAccess = TRUE if random access will be required
        options = importing options, see [gda.data_model_import.DataModelImport.newFile] for more information
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel newMem(string data, bool randomAccess, gda.set.Set options = null)
  {
    GdaDataModel* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    _cretval = gda_data_model_import_new_mem(_data, randomAccess, options ? cast(GdaSet*)options._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaDataModel and loads the data in node. The resulting data model
      can be accessed in a random way.
  
      Params:
        node = an XML node corresponding to a &lt;data-array&gt; tag
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel newXmlNode(libxml2.types.NodePtr node)
  {
    GdaDataModel* _cretval;
    _cretval = gda_data_model_import_new_xml_node(node);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Clears the history of errors model has to report
  */
  void cleanErrors()
  {
    gda_data_model_import_clean_errors(cast(GdaDataModelImport*)this._cPtr);
  }
}
