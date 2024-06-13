import { Gem, Sparkles, Wrench } from "lucide-react";
import { Link, useLocation } from "react-router-dom";
import classNames from "classnames";
import {
  HiOutlineLogout,
  HiOutlineViewGrid,
  HiOutlineCube,
  HiOutlineShoppingCart,
  HiOutlineUsers,
  HiOutlineDocumentText,
  HiOutlineQuestionMarkCircle,
  HiOutlineCog,
  HiCurrencyDollar,
} from "react-icons/hi";
import { BsTextParagraph } from "react-icons/bs";
import RingIcon from "../../product/components/RingIcon";
const linkClasses =
  "flex items-center gap-2 font-light px-3 py-2 hover:bg-neutral-700 hover:no-underline active:bg-neutral-600 round-sm text-base";

export default function Sidebar() {
  const DASHBOARD_SIDEBAR_LINKS = [
    {
      key: "dashboard",
      label: "Dashboard",
      path: "/admin",
      icon: <HiOutlineViewGrid />,
    },
    {
      key: "orders",
      label: "Orders",
      path: "/admin/order",
      icon: <HiOutlineShoppingCart size={20} />,
    },
    {
      key: "transactions",
      label: "Transactions",
      path: "/admin/transactions",
      icon: <HiOutlineDocumentText />,
    },
    {
      key : "warranty-request",
      label : "Warranty Request",
      path : "/admin/warranty-request",
      icon :  <Wrench/>
    },
    {
      key: "products",
      label: "Diamonds",
      path: "/admin/diamonds",
      icon: <HiOutlineCube />,
    },
    {
      key: "accessories",
      label: "Accessories",
      path: "/admin/accessories",
      icon: <Sparkles size={20} />,
    },
    {
      key: "salestaff",
      label: "Sale Staffs",
      path: "/admin/sale-staffs",
      icon: <HiOutlineUsers />,
    },
    {
      key: "deliverystaff",
      label: "Delivery Staffs",
      path: "/admin/delivery-staffs",
      icon: <HiOutlineUsers />,
    },
    {
      key: "customers",
      label: "Customers",
      path: "/admin/customers",
      icon: <HiOutlineUsers />,
    },
    {
      key: "diamond-price",
      label: "Diamond Price",
      path: "/admin/diamond-price",
      icon: <HiCurrencyDollar />,
    },
    {
      key: "accessory-price",
      label: "Accessory Price",
      path: "/admin/accessory-price",
      icon: <HiCurrencyDollar/>,
    },
    {
      key: "blog",
      label: "Blog",
      path: "/admin/blogs",
      icon: <BsTextParagraph/>,
    },
  ];

  // const DASHBOARD_SIDEBAR_BOTTOM_LINKS = [
  //   {
  //     key: "settings",
  //     label: "Settings",
  //     path: "/admin/settings",
  //     icon: <HiOutlineCog />,
  //   },
  //   {
  //     key: "support",
  //     label: "Help & Support",
  //     path: "/admin/support",
  //     icon: <HiOutlineQuestionMarkCircle />,
  //   },
  // ];

  return (
    <div className="flex flex-col bg-neutral-900 w-60 p-3 text-white">
      <Link to={"/"} className="flex items-center gap-2 px-1 py-3">
        <Gem strokeWidth={1.75} />
        <div className="text-neutral-100 text-xl">DatJ</div>
      </Link>

      <div className="flex-1 py-8 flex flex-col gap-0.5">
        {DASHBOARD_SIDEBAR_LINKS.map((items) => (
          <SidebarLink key={items.key} items={items} />
        ))}
      </div>
      <div className="flex flex-col gap-0.5 pt-2 border-t border-neutral-700">
       
        {/* {DASHBOARD_SIDEBAR_BOTTOM_LINKS.map((items) => (
          <SidebarLink key={items.key} items={items} />
        ))} */}

        <Link
          to="/"
          className={classNames(" text-red-500 cursor-pointer", linkClasses)}
        >
          <span className="text-xl">
            <HiOutlineLogout />
          </span>
          Logout
        </Link>
      </div>
    </div>
  );
}

function SidebarLink({ items }: { items: any }) {
  const { pathname } = useLocation();
  return (
    <Link
      to={items.path}
      className={classNames(
        pathname === items.path
          ? "text-amber-300 bg-neutral-700"
          : "text-white",
        linkClasses
      )}
    >
      <span className="text-xl">{items.icon}</span>
      {items.label}
    </Link>
  );
}
