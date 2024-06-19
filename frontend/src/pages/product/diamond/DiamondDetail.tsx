import { GET } from "../../../utils/request";
import { ExternalLink } from "lucide-react";
import { useNavigate, useParams } from "react-router-dom";
import { Image, Skeleton, App } from "antd";
import { useCartStore } from "../../../store/cartStore";
import scrollTo from "../../../utils/scroll";
import { useQueries } from "@tanstack/react-query";
import { getDiamondPrice } from "../../../utils/getPrice";
import { useEffect, useState } from "react";
export default function DiamondDetail() {
  // const [diamond, setDiamond] = useState<any>();
  const { diamondId } = useParams();
  useEffect(() => {
    scrollTo("choose-item");
  }, []);
  const [diamond, diamondPrice, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["diamond"],
        queryFn: () => GET(`/api/Diamonds/${diamondId}`),
        staleTime: 0,
      },
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
        staleTime: Infinity,
      },
    ],
  });
  const [showCertificate, setShowCertificate] = useState(false);
  const navigate = useNavigate();
  const setCart = useCartStore((state) => state.setCart);
  const setCurrentDiamond = useCartStore((state) => state.setCurrentDiamond);
  const setCurrentShape = useCartStore((state) => state.setCurrentShape);
  const { message } = App.useApp();
  return (
    <>
      <div className="flex justify-center mb-4">
        {diamond?.isLoading && (
          <Skeleton
            className="px-20 pt-6"
            active
            paragraph={{
              rows: 20,
            }}
          />
        )}
        {diamond?.data && (
          <div className="w-[1200px] grid grid-cols-6 gap-x-10">
            <div className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5">
              <Image
                style={{ height: "100%" }}
                src={`${diamond.data.imageUrl}`}
              />
            </div>
            <div className="col-span-2">
              <div className="mulish-regular text-2xl">
                {`${diamond?.data.carat} Carat ${diamond?.data.shape} Shape Lab Diamond`}
              </div>
              <div className="text-sm">
                Certificate Number#:
                <span className="ml-2">{diamond?.data.certificateNumber}</span>
              </div>
              <div className="text-3xl my-2">
                {diamondPrice?.data ? (
                  getDiamondPrice(
                    diamond.data,
                    diamondPrice?.data,
                    priceRate?.data.percent
                  ).toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })
                ) : (
                  <Skeleton.Button active={true} size="large" />
                )}
              </div>
              <div className="w-full grid grid-cols-2 gap-4 my-4 mulish-regular text-slate-950 ">
                <div className="flex flex-col gap-2">
                  <div>LAB</div>
                  <div>CERTIFICATE NUMBER</div>
                  <div>SHAPE</div>
                  <div>CARAT</div>
                  <div>CUT</div>
                  <div>COLOR</div>
                  <div>CLARITY</div>
                  <div>POLISH</div>
                  <div>SYMMETRY</div>
                  <div>FLUORESCENCE</div>
                </div>
                <div className="flex flex-col gap-2">
                  <div>{diamond.data.lab}</div>
                  <span
                    className="text-blue-500 flex cursor-pointer"
                    onClick={() => {
                      setShowCertificate(true);
                      scrollTo("view-certificate", "start");
                    }}
                  >
                    {diamond.data.certificateNumber}

                    <ExternalLink size={12} />
                  </span>
                  <div>{diamond.data.shape}</div>
                  <div>{diamond.data.carat}</div>
                  <div>{diamond.data.cut}</div>
                  <div>{diamond.data.color}</div>
                  <div>{diamond.data.clarity}</div>
                  <div>{diamond.data.polish}</div>
                  <div>{diamond.data.symmetry}</div>
                  <div>{diamond.data.fluorescence}</div>
                </div>
              </div>
              <div className="flex flex-col gap-4 mt-8">
                <div
                  className="uppercase tracking-wider text-xl w-full flex justify-center px-4 py-3 bg-primary text-white hover:scale-95 transition-all"
                  onClick={() => {
                    setCurrentShape(diamond.data.shape);
                    const result = setCurrentDiamond(diamond.data.diamondId);
                    if (result) {
                      navigate(
                        `/product/accessory?Shape=${diamond.data.shape}`
                      );
                    } else {
                      message.error("The diamond is already in your cart");
                      navigate("/product/diamond");
                    }
                  }}
                >
                  Choose This Diamond
                </div>
                <div
                  className="cursor-pointer tracking-widest text-xl w-full flex justify-center px-4 py-3 bg-slate-500 hover:scale-95 transition-all text-white"
                  onClick={() => {
                    setCart(diamond.data.diamondId);
                    navigate("/cart");
                  }}
                >
                  BUY WITHOUT ACCESSORY
                </div>
              </div>
              <div
                id="view-certificate"
                className="inline-block text-xl mt-4 hover:border-b border-black"
                onClick={async () => {
                  console.log(diamond.data.certificateUrl);
                  setShowCertificate(!showCertificate);
                  scrollTo("footer", "end");
                }}
              >
                {showCertificate ? "Hide Certificate" : "View Certificate"}
              </div>
            </div>
          </div>
        )}
      </div>
      {showCertificate && (
        <div className="px-52">
          <iframe
            className="aspect-video w-full"
            src={
              diamond.data.lab == "IGI"
                ? `https://www.igi.org/API-IGI/viewpdf-url.php?r=LG${diamond.data.certificateNumber}`
                : diamond.data.certificateUrl + "&locale=en_US"
            }
            title="Certification of IGI Lab"
          ></iframe>
          <div id="certificate"></div>
        </div>
      )}
      <div className="mb-20"></div>
    </>
  );
}
