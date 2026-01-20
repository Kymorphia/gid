/// Module for [Hypertext] interface
module atk.hypertext;

public import atk.hypertext_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.hyperlink;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The ATK interface which provides standard mechanism for manipulating hyperlinks.
    
    An interface used for objects which implement linking between
    multiple resource or content locations, or multiple 'markers'
    within a single document.  A Hypertext instance is associated with
    one or more Hyperlinks, which are associated with particular
    offsets within the Hypertext's included content.  While this
    interface is derived from Text, there is no requirement that
    Hypertext instances have textual content; they may implement Image
    as well, and Hyperlinks need not have non-zero text offsets.
*/
interface Hypertext
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_hypertext_get_type != &gidSymbolNotFound ? atk_hypertext_get_type() : cast(GType)0;
  }

  /**
      Gets the link in this hypertext document at index
      link_index
  
      Params:
        linkIndex = an integer specifying the desired link
      Returns: the link in this hypertext document at
        index link_index
  */
  atk.hyperlink.Hyperlink getLink(int linkIndex);

  /**
      Gets the index into the array of hyperlinks that is associated with
      the character specified by char_index.
  
      Params:
        charIndex = a character index
      Returns: an index into the array of hyperlinks in hypertext,
        or -1 if there is no hyperlink associated with this character.
  */
  int getLinkIndex(int charIndex);

  /**
      Gets the number of links within this hypertext document.
      Returns: the number of links within this hypertext document
  */
  int getNLinks();

  /**
      Connect to `LinkSelected` signal.
  
      The "link-selected" signal is emitted by an AtkHyperText
        object when one of the hyperlinks associated with the object
        is selected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int arg1, atk.hypertext.Hypertext hypertext))
  
          `arg1` the index of the hyperlink which is selected (optional)
  
          `hypertext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLinkSelected(T)(T callback, Flag!"After" after = No.After);
}
