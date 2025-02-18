//!repo Vte-3.91

//!subdtype Align AlignVte

//# Set arrays to be zero-terminated=1
//!set function[get_encodings].return-value.array[][zero-terminated] 1
//!set class[Pty].method[spawn_async].parameters.parameter[argv].array[][zero-terminated] 1
//!set class[Pty].method[spawn_async].parameters.parameter[envv].array[][zero-terminated] 1
//!set class[Pty].method[spawn_with_fds_async].parameters.parameter[argv].array[][zero-terminated] 1
//!set class[Pty].method[spawn_with_fds_async].parameters.parameter[envv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_async].parameters.parameter[argv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_async].parameters.parameter[envv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_sync].parameters.parameter[argv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_sync].parameters.parameter[envv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_with_fds_async].parameters.parameter[argv].array[][zero-terminated] 1
//!set class[Terminal].method[spawn_with_fds_async].parameters.parameter[envv].array[][zero-terminated] 1

//# Set basic parameters to out
//!set record[EventContext].method[get_coordinates].parameters.parameter[x][direction] out
//!set record[EventContext].method[get_coordinates].parameters.parameter[y][direction] out

//!set class[Terminal].method[get_xalign].return-value.type VteAlign
