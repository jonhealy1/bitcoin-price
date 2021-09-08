{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.HTTP.Simple            ( httpBS, getResponseBody )
import           Control.Lens                   ( preview )
import           Data.Aeson.Lens                ( key, _String )
import qualified Data.ByteString.Char8         as BS
import           Data.Text                      ( Text )

fetchJSON :: IO BS.ByteString
fetchJSON = do
  res <- httpBS "https://api.coindesk.com/v1/bpi/currentprice.json"
  return (getResponseBody res)

getRate :: BS.ByteString -> Maybe Text
getRate = preview (key "bpi" . key "USD" . key "rate" . _String)

main :: IO ()
main = do
  json <- fetchJSON
  print (getRate json)
