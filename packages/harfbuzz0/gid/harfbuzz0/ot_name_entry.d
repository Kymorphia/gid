/// Module for [OtNameEntry] class
module gid.harfbuzz0.ot_name_entry;

public import gid.core.basictypes;
import gid.core.gid;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Structure representing a name ID in a particular language.
*/
class OtNameEntry : StructWrap!(hb_ot_name_entry_t)
{
  /**
      Create a `ot_name_entry.OtNameEntry` wrap type.
      Params:
        nameId = name ID
  */
  this(gid.harfbuzz0.types.OtNameId nameId = gid.harfbuzz0.types.OtNameId.init) nothrow
  {
    this.nameId = nameId;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `nameId` field.
      Returns: name ID
  */
  @property gid.harfbuzz0.types.OtNameId nameId() nothrow
  {
    return (cast(hb_ot_name_entry_t*)this._cPtr).nameId;
  }

  /**
      Set `nameId` field.
      Params:
        propval = name ID
  */
  @property void nameId(gid.harfbuzz0.types.OtNameId propval) nothrow
  {
    (cast(hb_ot_name_entry_t*)this._cPtr).nameId = propval;
  }

  /**
      Get `language` field.
      Returns: language
  */
  @property gid.harfbuzz0.types.Language language() nothrow
  {
    return (cast(hb_ot_name_entry_t*)this._cPtr).language;
  }
}
