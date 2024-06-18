import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import {
  Button,
  Form,
  Image,
  Input,
  InputNumber,
  Select,
  Skeleton,
} from "antd";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import * as z from "zod";
import { Link, useNavigate, useParams } from "react-router-dom";
import { useCartStore } from "../../../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import ImageList from "./components/ImageList";
import { getAccessoryPrice } from "../../../utils/getPrice";
import scrollTo from "../../../utils/scroll";
import { zodResolver } from "@hookform/resolvers/zod";

const schema = z.object({
  size: z.coerce
    .number()
    .min(3, { message: "Size must be between 3 and 8 cm" })
    .max(8, { message: "Size must be between 3 and 8 cm" }),
});

export default function AccessoryDetail() {
  const { accessoryId } = useParams();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const [size, setSize] = useState(0);
  const { control, handleSubmit } = useForm({
    defaultValues: {
      size: "",
    },
    resolver: zodResolver(schema),
  });
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  scrollTo("choose-item");
  useEffect(() => {
    setQueryUrl(`/api/Accessories/${accessoryId}`);
  }, []);
  console.log(queryUrl);
  const [accessory, materialPrices, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["accessory", queryUrl],
        queryFn: () => GET(queryUrl),
      },
      {
        queryKey: ["materialPrices"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
        staleTime: Infinity,
      },
    ],
  });

  const [mainImage, setMainImage] = useState<string | undefined>(undefined);
  useEffect(() => {
    if (accessory?.data) {
      if (accessory?.data?.accessoryImages?.length >= 1) {
        setMainImage(
          accessory?.data?.accessoryImages[0]?.url.replace("400x", "800x")
        );
      }
    }
  }, [accessory]);
  const navigate = useNavigate();
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  return (
    <div>
      {accessory.isLoading && (
        <Skeleton
          className="px-20 pt-6"
          active
          paragraph={{
            rows: 20,
          }}
        />
      )}
      <div className="flex justify-center mb-20">
        {accessory?.data && (
          <div className="w-[1200px] grid grid-cols-8 gap-10">
            <ImageList
              setMainImage={setMainImage}
              images={accessory.data.accessoryImages}
            />
            <div className="border col-span-4 aspect-square bg-cover bg-top bg-no-repeat w-full">
              <Image alt="alt" className="w-full" src={`${mainImage}`} />
            </div>
            <div className="col-span-3">
              <div className="mulish-regular text-2xl">
                {`${accessory?.data.name}`}
              </div>
              <div className="text-3xl">
                {priceRate?.data && materialPrices?.data ? (
                  getAccessoryPrice(
                    accessory?.data,
                    materialPrices?.data,
                    size,
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
                  <div>MATERIAL WEIGHT</div>
                  <div>TYPE</div>
                  <div>KARAT</div>
                  <div>SUITABLE WITH</div>
                </div>
                <div className="flex flex-col gap-2">
                  <div>{accessory?.data?.materialWeight?.toFixed(2)} g</div>
                  <div>{accessory?.data?.accessoryType?.name}</div>
                  <div>{accessory?.data?.karat}K</div>
                  <div>{accessory?.data?.shape?.name} Shape Diamond</div>
                </div>
              </div>
              <div className="flex flex-col gap-4">
                <Form
                  // layout="vertical"
                  className="flex flex-col gap-[2px]"
                  onFinish={handleSubmit((formData) => {
                    if (currentDiamond) {
                      setCurrentAccessory(
                        accessory?.data.accessoryId,
                        Number(formData.size)
                      );
                      navigate("/product/complete");
                    }
                  })}
                >
                  <div>
                    <Link
                      to="/about?action=measure-guide"
                      className="text-sm border-b border-b-transparent hover:border-b-primary hover:text-primary"
                    >
                      Ring Size Guide
                    </Link>
                  </div>
                  <FormItem
                    className="inline-block h-full mb-0"
                    name="size"
                    label="Choose ring size (cm):"
                    control={control}
                    required
                  >
                    <Input
                      className="w-[100px]"
                      onChange={(value) => {
                        setSize(Number(value.target.value));
                      }}
                    />
                  </FormItem>
                  {currentDiamond && (
                    <Form.Item className="mb-0 mt-2">
                      <Button
                        className="flex text-xl w-full py-7 items-center justify-center bg-primary hover:scale-95 transition-all
                        rounded-md text-white"
                        htmlType="submit"
                      >
                        CHOOSE THIS ACCESSORY
                      </Button>
                    </Form.Item>
                  )}
                </Form>
                {!currentDiamond && (
                  <div className="text-xl py-6 w-full bg-gray-200 text-slate-500 hover:scale-95 transition-all rounded-md">
                    <div className="text-center uppercase">
                      Choose this accessory
                    </div>
                    <div className="text-center">
                      (YOU NEED TO CHOOSE DIAMOND FIRST)
                    </div>
                  </div>
                )}
                {!currentDiamond && (
                  <>
                    <div
                      className="text-xl w-full rounded-md flex justify-center px-4 py-4 text-white bg-primary hover:scale-95 transition-all cursor-pointer"
                      onClick={() => {
                        navigate("/product/diamond");
                      }}
                    >
                      CHOOSE DIAMOND
                    </div>
                  </>
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
