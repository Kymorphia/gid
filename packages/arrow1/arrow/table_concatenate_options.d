/// Module for [TableConcatenateOptions] class
module arrow.table_concatenate_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class TableConcatenateOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_table_concatenate_options_get_type != &gidSymbolNotFound ? garrow_table_concatenate_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TableConcatenateOptions self()
  {
    return this;
  }

  /**
      Get `promoteNullability` property.
      Returns: If true, a #GArrowField of #GArrowNullDataType can be unified
        with a #GArrowField of another type. The unified field will be of
        the other type and become nullable. Nullability will be promoted
        to the looser option (nullable if one is not nullable).
  */
  @property bool promoteNullability()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("promote-nullability");
  }

  /**
      Set `promoteNullability` property.
      Params:
        propval = If true, a #GArrowField of #GArrowNullDataType can be unified
          with a #GArrowField of another type. The unified field will be of
          the other type and become nullable. Nullability will be promoted
          to the looser option (nullable if one is not nullable).
  */
  @property void promoteNullability(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("promote-nullability", propval);
  }

  /**
      Get `unifySchemas` property.
      Returns: If true, the schemas of the tables will be first unified with
        fields of the same name being merged, according to
        #GArrowTableConcatenateOptions:promote-nullability, then each
        table will be promoted to the unified schema before being
        concatenated.
        
        Otherwise, all tables should have the same schema. Each column in
        the output table is the result of concatenating the corresponding
        columns in all input tables.
  */
  @property bool unifySchemas()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("unify-schemas");
  }

  /**
      Set `unifySchemas` property.
      Params:
        propval = If true, the schemas of the tables will be first unified with
          fields of the same name being merged, according to
          #GArrowTableConcatenateOptions:promote-nullability, then each
          table will be promoted to the unified schema before being
          concatenated.
          
          Otherwise, all tables should have the same schema. Each column in
          the output table is the result of concatenating the corresponding
          columns in all input tables.
  */
  @property void unifySchemas(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("unify-schemas", propval);
  }

  /** */
  this()
  {
    GArrowTableConcatenateOptions* _cretval;
    _cretval = garrow_table_concatenate_options_new();
    this(_cretval, Yes.Take);
  }
}
