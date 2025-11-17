## A. Command-line argument parsing
The **getopts** utility was used to process the `-a` and `-n` options.

- `-a` enabled counting both files and directories.  
- `-n N` specified how many of the largest entries should be shown (default **10**).

---

## B. Handling missing arguments
A check was performed after option parsing to ensure that at least one directory was provided.  
If none was given, a usage message was displayed and the script exited.

---

## C. Processing each directory
Each directory argument was handled in a loop.  
Depending on whether `-a` was set, either:

- `du -ah` (include files), or  
- `du -h --max-depth=1` (directories only)

was executed.

Error messages from `du` were suppressed by redirecting stderr to `/dev/null`.

---

## D. Producing the top N results
The output from `du` was piped through:

- `sort -hr` → sort entries by human-readable size  
- `head -n N` → limit the number of results  

This pipeline produced the largest items for each directory according to the user’s options.
