/// Module for [SegmentProperties] class
module gid.harfbuzz0.segment_properties;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
    set and retrieved using [gid.harfbuzz0.global.bufferSetSegmentProperties] and
    [gid.harfbuzz0.global.bufferGetSegmentProperties], respectively.
*/
class SegmentProperties : gid.gobject2.boxed.BoxedWrap!(hb_gobject_segment_properties_get_type)
{
  /**
      Create a `segment_properties.SegmentProperties` boxed type.
      Params:
        direction = the #hb_direction_t of the buffer, see [gid.harfbuzz0.global.bufferSetDirection].
        script = the #hb_script_t of the buffer, see [gid.harfbuzz0.global.bufferSetScript].
  */
  this(gid.harfbuzz0.types.Direction direction = gid.harfbuzz0.types.Direction.init, gid.harfbuzz0.types.Script script = gid.harfbuzz0.types.Script.init) nothrow
  {
    super(boxedNew!hb_segment_properties_t(_getGType), Yes.Take);
    this.direction = direction;
    this.script = script;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override SegmentProperties self() nothrow
  {
    return this;
  }

  /**
      Get `direction` field.
      Returns: the #hb_direction_t of the buffer, see [gid.harfbuzz0.global.bufferSetDirection].
  */
  @property gid.harfbuzz0.types.Direction direction() nothrow
  {
    return cast(gid.harfbuzz0.types.Direction)(cast(hb_segment_properties_t*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the #hb_direction_t of the buffer, see [gid.harfbuzz0.global.bufferSetDirection].
  */
  @property void direction(gid.harfbuzz0.types.Direction propval) nothrow
  {
    (cast(hb_segment_properties_t*)this._cPtr).direction = cast(hb_direction_t)propval;
  }

  /**
      Get `script` field.
      Returns: the #hb_script_t of the buffer, see [gid.harfbuzz0.global.bufferSetScript].
  */
  @property gid.harfbuzz0.types.Script script() nothrow
  {
    return cast(gid.harfbuzz0.types.Script)(cast(hb_segment_properties_t*)this._cPtr).script;
  }

  /**
      Set `script` field.
      Params:
        propval = the #hb_script_t of the buffer, see [gid.harfbuzz0.global.bufferSetScript].
  */
  @property void script(gid.harfbuzz0.types.Script propval) nothrow
  {
    (cast(hb_segment_properties_t*)this._cPtr).script = cast(hb_script_t)propval;
  }

  /**
      Get `language` field.
      Returns: the #hb_language_t of the buffer, see [gid.harfbuzz0.global.bufferSetLanguage].
  */
  @property gid.harfbuzz0.types.Language language() nothrow
  {
    return (cast(hb_segment_properties_t*)this._cPtr).language;
  }
}
