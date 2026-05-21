import os
import re

dir_path = r"C:\Users\Admin\OneDrive\Desktop\pttk\BEpttk\src\main\java\com\digitaltravel\erp\controller"

def map_url_to_roles(url):
    if "/api/quan-tri" in url:
        return "'ADMIN'"
    elif "/api/san-pham" in url:
        return "'SANPHAM', 'ADMIN'"
    elif "/api/kinh-doanh" in url:
        return "'KINHDOANH', 'ADMIN'"
    elif "/api/dieu-hanh" in url:
        return "'DIEUHANH', 'ADMIN'"
    elif "/api/huong-dan-vien" in url:
        return "'HDV', 'DIEUHANH', 'ADMIN'" # typically
    elif "/api/ke-toan" in url:
        return "'KETOAN', 'ADMIN'"
    elif "/api/khach-hang" in url:
        return "'KHACHHANG', 'ADMIN'"
    elif "/api/thanh-toan" in url:
        return "'KHACHHANG', 'ADMIN'"
    return "'ADMIN'"

for root, _, files in os.walk(dir_path):
    for f in files:
        if f.endswith("Controller.java"):
            filepath = os.path.join(root, f)
            with open(filepath, "r", encoding="utf-8") as file:
                lines = file.readlines()
            
            changed = False
            for i in range(len(lines)):
                if "@PreAuthorize(\"hasAnyRole('', 'ADMIN')\")" in lines[i]:
                    # look around for the mapping
                    found_url = None
                    # check up to 3 lines up
                    for j in range(max(0, i-3), i):
                        m = re.search(r'Mapping\("([^"]+)"', lines[j])
                        if m:
                            found_url = m.group(1)
                            break
                    # check class level RequestMapping if not found
                    if not found_url:
                        for j in range(i):
                            m = re.search(r'@RequestMapping\("([^"]+)"\)', lines[j])
                            if m:
                                found_url = m.group(1)
                                break
                                
                    if found_url:
                        roles = map_url_to_roles(found_url)
                        lines[i] = lines[i].replace("hasAnyRole('', 'ADMIN')", f"hasAnyRole({roles})")
                        changed = True
            
            if changed:
                with open(filepath, "w", encoding="utf-8") as file:
                    file.writelines(lines)
                print(f"Fixed {f}")
