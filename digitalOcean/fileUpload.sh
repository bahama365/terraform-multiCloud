#!/bin/bash
#!/bin/bash
s3cmd put milo.jpeg s3://hduihewuib/
s3cmd setacl s3://hduihewuib/milo.jpeg --acl-public
