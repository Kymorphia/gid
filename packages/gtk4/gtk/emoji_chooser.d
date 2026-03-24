/// Module for [EmojiChooser] class
module gtk.emoji_chooser;

import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.popover;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;

/**
    The [gtk.emoji_chooser.EmojiChooser] is used by text widgets such as [gtk.entry.Entry] or
    [gtk.text_view.TextView] to let users insert Emoji characters.
    
    ![An example GtkEmojiChooser](emojichooser.png)
    
    [gtk.emoji_chooser.EmojiChooser] emits the `signal@Gtk.EmojiChooser::emoji-picked`
    signal when an Emoji is selected.
    
    # CSS nodes
    
    ```
    popover
    ├── box.emoji-searchbar
    │   ╰── entry.search
    ╰── box.emoji-toolbar
        ├── button.image-button.emoji-section
        ├── ...
        ╰── button.image-button.emoji-section
    ```
    
    Every [gtk.emoji_chooser.EmojiChooser] consists of a main node called popover.
    The contents of the popover are largely implementation defined
    and supposed to inherit general styles.
    The top searchbar used to search emoji and gets the .emoji-searchbar
    style class itself.
    The bottom toolbar used to switch between different emoji categories
    consists of buttons with the .emoji-section style class and gets the
    .emoji-toolbar style class itself.
*/
class EmojiChooser : gtk.popover.Popover
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
    return cast(void function())gtk_emoji_chooser_get_type != &gidSymbolNotFound ? gtk_emoji_chooser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EmojiChooser self()
  {
    return this;
  }

  /**
  Get builder for [gtk.emoji_chooser.EmojiChooser]
  Returns: New builder object
  */
  static EmojiChooserGidBuilder builder()
  {
    return new EmojiChooserGidBuilder;
  }

  /**
      Creates a new [gtk.emoji_chooser.EmojiChooser].
      Returns: a new [gtk.emoji_chooser.EmojiChooser]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_emoji_chooser_new();
    this(_cretval, No.Take);
  }

  /**
      Connect to `EmojiPicked` signal.
  
      Emitted when the user selects an Emoji.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string text, gtk.emoji_chooser.EmojiChooser emojiChooser))
  
          `text` the Unicode sequence for the picked Emoji, in UTF-8 (optional)
  
          `emojiChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEmojiPicked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.emoji_chooser.EmojiChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("emoji-picked", closure, after);
  }
}

class EmojiChooserGidBuilderImpl(T) : gtk.popover.PopoverGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.emoji_chooser.EmojiChooser]
final class EmojiChooserGidBuilder : EmojiChooserGidBuilderImpl!EmojiChooserGidBuilder
{
  EmojiChooser build()
  {
    return new EmojiChooser(cast(void*)createGObject(EmojiChooser._getGType), No.Take);
  }
}
