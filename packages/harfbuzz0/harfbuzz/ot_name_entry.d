/// Module for [OtNameEntry] class
module harfbuzz.ot_name_entry;

public import gid.basictypes;
import gid.gid;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Structure representing a name ID in a particular language.
*/
class OtNameEntry
{
  hb_ot_name_entry_t _cInstance;

  /**
      Create a `ot_name_entry.OtNameEntry` wrap type.
      Params:
        nameId = name ID
  */
  this(harfbuzz.types.OtNameId nameId = harfbuzz.types.OtNameId.init) nothrow
  {
    this.nameId = nameId;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(hb_ot_name_entry_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `nameId` field.
      Returns: name ID
  */
  @property harfbuzz.types.OtNameId nameId() nothrow
  {
    return (cast(hb_ot_name_entry_t*)this._cPtr).nameId;
  }

  /**
      Set `nameId` field.
      Params:
        propval = name ID
  */
  @property void nameId(harfbuzz.types.OtNameId propval) nothrow
  {
    (cast(hb_ot_name_entry_t*)this._cPtr).nameId = propval;
  }

  /**
      Get `language` field.
      Returns: language
  */
  @property harfbuzz.types.Language language() nothrow
  {
    return (cast(hb_ot_name_entry_t*)this._cPtr).language;
  }
}
