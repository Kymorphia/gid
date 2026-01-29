/// Module for [SegmentProperties] class
module harfbuzz.segment_properties;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
    set and retrieved using [harfbuzz.global.bufferSetSegmentProperties] and
    [harfbuzz.global.bufferGetSegmentProperties], respectively.
*/
class SegmentProperties : gobject.boxed.Boxed
{

  /**
      Create a `segment_properties.SegmentProperties` boxed type.
      Params:
        direction = the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
        script = the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  this(harfbuzz.types.Direction direction = harfbuzz.types.Direction.init, harfbuzz.types.Script script = harfbuzz.types.Script.init)
  {
    super(gMalloc(hb_segment_properties_t.sizeof), Yes.Take);
    this.direction = direction;
    this.script = script;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_segment_properties_get_type != &gidSymbolNotFound ? hb_gobject_segment_properties_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SegmentProperties self()
  {
    return this;
  }

  /**
      Get `direction` field.
      Returns: the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
  */
  @property harfbuzz.types.Direction direction()
  {
    return cast(harfbuzz.types.Direction)(cast(hb_segment_properties_t*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
  */
  @property void direction(harfbuzz.types.Direction propval)
  {
    (cast(hb_segment_properties_t*)this._cPtr).direction = cast(hb_direction_t)propval;
  }

  /**
      Get `script` field.
      Returns: the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  @property harfbuzz.types.Script script()
  {
    return cast(harfbuzz.types.Script)(cast(hb_segment_properties_t*)this._cPtr).script;
  }

  /**
      Set `script` field.
      Params:
        propval = the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  @property void script(harfbuzz.types.Script propval)
  {
    (cast(hb_segment_properties_t*)this._cPtr).script = cast(hb_script_t)propval;
  }

  /**
      Get `language` field.
      Returns: the #hb_language_t of the buffer, see [harfbuzz.global.bufferSetLanguage].
  */
  @property harfbuzz.types.Language language()
  {
    return (cast(hb_segment_properties_t*)this._cPtr).language;
  }
}
