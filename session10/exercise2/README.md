### Luu y

- Trigger su dung before delete -> truoc khi thuc hien delete thi chay.
- Dieu kien IF trong trigger su dung OLD.quantity (neu chi viet quantity ma khong co OLD thi se bi loi), khong co NEW.quantity vi khi xoa
  thi khong co doi truong NEW duoc tao ra.
- signal sqlstate '45000' set message_txt co nghia la , nem ra 1 signal , co sqlstate la 45000 voi 45 la ma loi nguoi dung tu dinh nghia 000 la khong chi tiet la loi gi, set message_text thiet lap thong bao loi. khi nem ra signal thi cau lenh update, insert, delete se bi rollback.
