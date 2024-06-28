import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { jwtDecode } from "jwt-decode";
import { getCookie } from "../../../../utils/cookie";

export const DeliveryStaffMenu = ({
  handleStaffClick,
  staffText,
  staffs,
  statusText,
}: {
  handleStaffClick: any;
  staffText: any;
  staffs: any[];
  statusText: any;
}) => {
  return (
    <Dropdown
      disabled={
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "WarrantyStaff" ||
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "DeliveryStaff" ||
        statusText != "Pending"
      }
      overlay={
        <Menu defaultValue={staffText}>
          {staffs.map((staff: any) => (
            <Menu.Item key={staff.name}>
              <a onClick={() => handleStaffClick(staff.accountId)}>
                {staff.name}
              </a>
            </Menu.Item>
          ))}
        </Menu>
      }
      placement="bottom"
      trigger={["click"]}
    >
      <Button className="border p-2 rounded-md flex items-center">
        <span>{staffText}</span>
        <DownOutlined className="ml-1" />
      </Button>
    </Dropdown>
  );
};
