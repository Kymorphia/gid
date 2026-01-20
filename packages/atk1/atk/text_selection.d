/// Module for [TextSelection] class
module atk.text_selection;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;

/**
    This structure represents a single  text selection within a document. This
    selection is defined by two points in the content, where each one is defined
    by an AtkObject supporting the AtkText interface and a character offset
    relative to it.
    
    The end object must appear after the start object in the accessibility tree,
    i.e. the end object must be reachable from the start object by navigating
    forward (next, first child etc).
    
    This struct also contains a @start_is_active boolean, to communicate if the
    start of the selection is the active point or not.
    
    The active point corresponds to the user's focus or point of interest. The
    user moves the active point to expand or collapse the range. The anchor
    point is the other point of the range and typically remains constant. In
    most cases, anchor is the start of the range and active is the end. However,
    when selecting backwards (e.g. pressing shift+left arrow in a text field),
    the start of the range is the active point, as the user moves this to
    manipulate the selection.
*/
class TextSelection
{
  AtkTextSelection _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for atk.text_selection.TextSelection");

    _cInstance = *cast(AtkTextSelection*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `startObject` field.
      Returns: the AtkText containing the start of the selection.
  */
  @property atk.object.ObjectWrap startObject()
  {
    return cToD!(atk.object.ObjectWrap)(cast(void*)(cast(AtkTextSelection*)this._cPtr).startObject);
  }

  /**
      Set `startObject` field.
      Params:
        propval = the AtkText containing the start of the selection.
  */
  @property void startObject(atk.object.ObjectWrap propval)
  {
    cValueFree!(atk.object.ObjectWrap)(cast(void*)(cast(AtkTextSelection*)this._cPtr).startObject);
    dToC(propval, cast(void*)&(cast(AtkTextSelection*)this._cPtr).startObject);
  }

  /**
      Get `startOffset` field.
      Returns: the text offset of the beginning of the selection within
                       @start_object.
  */
  @property int startOffset()
  {
    return (cast(AtkTextSelection*)this._cPtr).startOffset;
  }

  /**
      Set `startOffset` field.
      Params:
        propval = the text offset of the beginning of the selection within
                         @start_object.
  */
  @property void startOffset(int propval)
  {
    (cast(AtkTextSelection*)this._cPtr).startOffset = propval;
  }

  /**
      Get `endObject` field.
      Returns: the AtkText containing the end of the selection.
  */
  @property atk.object.ObjectWrap endObject()
  {
    return cToD!(atk.object.ObjectWrap)(cast(void*)(cast(AtkTextSelection*)this._cPtr).endObject);
  }

  /**
      Set `endObject` field.
      Params:
        propval = the AtkText containing the end of the selection.
  */
  @property void endObject(atk.object.ObjectWrap propval)
  {
    cValueFree!(atk.object.ObjectWrap)(cast(void*)(cast(AtkTextSelection*)this._cPtr).endObject);
    dToC(propval, cast(void*)&(cast(AtkTextSelection*)this._cPtr).endObject);
  }

  /**
      Get `endOffset` field.
      Returns: the text offset of the end of the selection within @end_object.
  */
  @property int endOffset()
  {
    return (cast(AtkTextSelection*)this._cPtr).endOffset;
  }

  /**
      Set `endOffset` field.
      Params:
        propval = the text offset of the end of the selection within @end_object.
  */
  @property void endOffset(int propval)
  {
    (cast(AtkTextSelection*)this._cPtr).endOffset = propval;
  }

  /**
      Get `startIsActive` field.
      Returns: a gboolean indicating whether the start of the selection
                         is the active point.
  */
  @property bool startIsActive()
  {
    return cast(bool)(cast(AtkTextSelection*)this._cPtr).startIsActive;
  }

  /**
      Set `startIsActive` field.
      Params:
        propval = a gboolean indicating whether the start of the selection
                           is the active point.
  */
  @property void startIsActive(bool propval)
  {
    (cast(AtkTextSelection*)this._cPtr).startIsActive = propval;
  }
}
