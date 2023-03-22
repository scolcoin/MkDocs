cd /root/mainnet1/docs/
 mkdocs build && rm -rf /home/scol_docs/site && cp -avr /root/mainnet1/docs/site /home/scol_docs && chcon -Rt httpd_sys_content_t /home/scol_docs