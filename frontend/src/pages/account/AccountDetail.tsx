import { Button, App } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { formatPhoneNumber } from "../../utils/formatter";
import moment from "moment";
import { useNavigate } from "react-router-dom";
import { rankImages } from "../../constants/rankImages";

export default function AccountDetail() {
  const [userInfo, setUserInfo] = useState<any>();
  const { message } = App.useApp();

  const field = [
    "name",
    "email",
    "phoneNumber",
    "address",
    "birthday",
    "gender",
    "createdAt",
  ];
  const navigate = useNavigate();
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Accounts/me`);
      console.log(data);
      if (data) {
        setUserInfo(data);
      } else {
        setCookie("accessToken", "", 0);
        navigate("/authentication/login");
        message.error("Your session has timed out, please login again!");
      }
    })();
  }, []);

  return (
    <div className="ml-4 mt-4 mb-8">
      <div className="font-bold mulish-regular text-xl mb-4">
        ACCOUNT DETAIL
      </div>
      <div className="flex gap-10">
        <div className="flex flex-col items-center">
          <div
            className="bg-white aspect-square w-[240px] rounded-full bg-cover bg-center bg-no-repeat border"
            style={{
              backgroundImage: `url(https://robohash.org/${userInfo?.name})`,
            }}
          ></div>
          <div className="mt-4 font-semibold text-xl flex items-center gap-2">
            {userInfo?.name}
            <div
              title={userInfo?.rank?.rankName}
              className="aspect-square w-[50px] rounded-full bg-cover bg-center bg-no-repeat"
              style={{
                backgroundImage: `url(${
                  rankImages.find(
                    (rank) => rank.rankName == userInfo?.rank?.rankName
                  )?.image
                })`,
              }}
            ></div>
          </div>
        </div>
        <div>
          <div className="pl-10 grid grid-cols-2 gap-y-4 gap-x-14">
            {userInfo && (
              <>
                {field.map((key) => {
                  return (
                    <div>
                      <div className="uppercase text-base font-semibold border-b border-black mb-2">
                        {key}
                      </div>

                      <div>
                        {key == "birthday" || key == "createdAt"
                          ? moment(userInfo[key]).format("MM/DD/YYYY")
                          : key == "phoneNumber"
                          ? formatPhoneNumber(userInfo[key])
                          : userInfo[key]}
                      </div>
                    </div>
                  );
                  // return <Field key={key} field={key} value={userInfo[key]} />;
                })}
              </>
            )}
          </div>
        </div>
      </div>

      <div className="mt-6 flex gap-4">
        <Button
          className="uppercase px-4 hover:scale-95 font-bold text-white bg-primary py-4 flex items-center justify-center"
          htmlType="submit"
          onClick={() => {
            setCookie("accessToken", "", 0);
            navigate("/authentication/login");
          }}
        >
          Logout
        </Button>
        <Button
          className="px-4 hover:scale-95 font-bold text-white bg-primary py-4 flex items-center justify-center"
          htmlType="submit"
          onClick={() => {
            navigate("/account/edit");
          }}
        >
          EDIT PROFILE
        </Button>
      </div>
    </div>
  );
}
