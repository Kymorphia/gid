/// Module for [XaTransactionId] struct
module gda.xa_transaction_id;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
struct XaTransactionId
{
  /**
      any number
  */
  uint format;

  /**
      number between 1 and 64
  */
  ushort gtridLength;

  /**
      number between 1 and 64
  */
  ushort bqualLength;

  /** */
  char[128] data;

  /**
      Creates a string representation of xid, in the format &lt;gtrid&gt;,&lt;bqual&gt;,&lt;formatID&gt; the
      &lt;gtrid&gt; and &lt;bqual&gt; strings contain alphanumeric characters, and non alphanumeric characters
      are converted to "`ab`" where ab is the hexadecimal representation of the character.
      Returns: a new string representation of xid
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gda_xa_transaction_id_to_string(cast(const(GdaXaTransactionId)*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
