package slitherandroid_fla
{
    import com.milkmangames.nativeextensions.*;
    import com.milkmangames.nativeextensions.android.*;
    import com.milkmangames.nativeextensions.android.events.*;
    import com.milkmangames.nativeextensions.events.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    import flash.utils.*;
    import gaim.*;
    import starling.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var loadscreen:MovieClip;
        public var oybox:TextField;
        public var final_build:Object;
        public var is_android:Object;
        public var is_kindle:Object;
        public var has_ads:Object;
        public var so:SharedObject;
        public var main:Main;
        public var root_mc:Object;
        public var has_rate_box:Object;
        public var did_rate_prompt:Object;
        public var ettlaia:Object;
        public var ltliatm:Object;
        public var ciiiraatm:Object;
        public var has_viral:Object;
        public var has_generic_share:Object;
        public var iaps_enabled:Object;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function onInvoke(param1)
        {
            if (this.has_rate_box)
            {
                RateBox.rateBox.onLaunch();
            }
            return;
        }// end function

        public function tryLoadInterstitial()
        {
            if (this.has_ads)
            {
                this.ettlaia = true;
                this.ciiiraatm = getTimer() + 3000;
                this.ltliatm = getTimer();
                try
                {
                    AdMob.loadInterstitial("ca-app-pub-0051214680937399/5587074315", false);
                }
                catch (qe)
                {
                }
            }
            return;
        }// end function

        public function onReceiveAd(event:AdMobEvent)
        {
            if (!event.isInterstitial)
            {
                if (!this.has_ads)
                {
                    AdMob.setVisibility(false);
                }
            }
            return;
        }// end function

        public function onDismissedInterstitial(event:AdMobEvent)
        {
            this.tryLoadInterstitial();
            return;
        }// end function

        public function onIAPReady(param1)
        {
            this.iaps_enabled = true;
            this.main.iapsEnabled();
            AndroidIAB.androidIAB.loadPlayerInventory();
            return;
        }// end function

        public function onIAPUnsupported(param1)
        {
            this.iaps_enabled = false;
            this.main.iaps_enabled = false;
            return;
        }// end function

        public function onInventoryLoaded(event:AndroidBillingEvent) : void
        {
            var _loc_2:* = null;
            for each (_loc_2 in event.purchases)
            {
                
                this.handlePurchasedItem(_loc_2.itemId);
            }
            return;
        }// end function

        public function onInventoryFailed(param1)
        {
            return;
        }// end function

        public function onConsumeSuccess(param1)
        {
            return;
        }// end function

        public function onConsumeFailed(param1)
        {
            return;
        }// end function

        public function onPurchaseSuccess(event:AndroidBillingEvent) : void
        {
            var _loc_2:* = null;
            for each (_loc_2 in event.purchases)
            {
                
                this.handlePurchasedItem(_loc_2.itemId);
            }
            AndroidIAB.androidIAB.loadPlayerInventory();
            return;
        }// end function

        public function onPurchaseFailed(event:AndroidBillingErrorEvent) : void
        {
            trace("Something went wrong with the purchase of " + event.itemId + ": " + event.text);
            return;
        }// end function

        public function handlePurchasedItem(param1)
        {
            if (param1 == "remove_ads")
            {
                this.main.setSo("disable_ads", "1");
                this.disableAdsNow();
            }
            return;
        }// end function

        public function showAd()
        {
            if (this.has_ads)
            {
                if (this.main.allow_ads)
                {
                    if (AdMob.isInterstitialReady())
                    {
                        AdMob.showPendingInterstitial();
                    }
                }
            }
            return;
        }// end function

        public function disableAdsNow()
        {
            this.has_ads = false;
            this.main.disableAdsNow();
            return;
        }// end function

        function frame1()
        {
            this.final_build = true;
            this.is_android = true;
            this.is_kindle = false;
            this.has_ads = false;
            if (AdMob.isSupported)
            {
                this.has_ads = true;
            }
            this.main = new Main(stage, this, this.has_ads, this.is_android, this.is_kindle, this.final_build);
            this.loadscreen.x = stage.fullScreenWidth / 2;
            this.loadscreen.y = stage.fullScreenHeight / 2;
            this.root_mc = this;
            this.main.ready = function ()
            {
                root_mc.removeChild(oybox);
                root_mc.removeChild(loadscreen);
                return;
            }// end function
            ;
            if (!this.final_build)
            {
            }
            this.has_rate_box = false;
            this.did_rate_prompt = false;
            try
            {
                this.so = SharedObject.getLocal("game");
                if (this.so)
                {
                    if (this.so.data)
                    {
                        if (this.so.data.did_rate_prompt == "1")
                        {
                            this.did_rate_prompt = true;
                        }
                    }
                }
            }
            catch (ee)
            {
            }
            if (RateBox.isSupported())
            {
                this.has_rate_box = true;
                if (this.is_android)
                {
                    RateBox.create("", "rate slither.io", "Thank you so much for playing! Would you please rate our game in the Play Store? It would mean a lot to us!");
                }
                else
                {
                    RateBox.create("968402209", "rate slither.io", "Thank you so much for playing! Would you please rate our game in the App Store? It would mean a lot to us!");
                }
                if (!this.final_build)
                {
                    RateBox.rateBox.useTestMode();
                }
                RateBox.rateBox.setAutoPrompt(false);
                if (!this.main.is_mac)
                {
                    NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, this.onInvoke);
                }
            }
            if (!this.has_rate_box)
            {
                this.did_rate_prompt = true;
            }
            this.ettlaia = false;
            this.ltliatm = 0;
            this.ciiiraatm = -1;
            this.main.external_oef = function ()
            {
                var _loc_1:* = undefined;
                if (ettlaia)
                {
                    if (ciiiraatm != -1)
                    {
                        _loc_1 = getTimer();
                        if (_loc_1 > ciiiraatm)
                        {
                            ciiiraatm = _loc_1 + 6000;
                            if (AdMob.isInterstitialReady())
                            {
                                ciiiraatm = -1;
                            }
                            else if (ltliatm + 24000 > _loc_1)
                            {
                                tryLoadInterstitial();
                            }
                        }
                    }
                }
                return;
            }// end function
            ;
            if (this.has_ads)
            {
                AdMob.init("ca-app-pub-0051214680937399/5587074315");
                if (!this.final_build)
                {
                    AdMob.enableTestDeviceIDs(AdMob.getCurrentTestDeviceIDs());
                }
                this.tryLoadInterstitial();
                AdMob.addEventListener(AdMobEvent.RECEIVED_AD, this.onReceiveAd);
                AdMob.addEventListener(AdMobEvent.SCREEN_DISMISSED, this.onDismissedInterstitial);
            }
            this.has_viral = false;
            this.has_generic_share = false;
            if (GoViral.isSupported())
            {
                GoViral.create();
                this.has_viral = true;
                if (GoViral.goViral.isGenericShareAvailable())
                {
                    this.has_generic_share = true;
                    this.main.has_generic_share = true;
                }
            }
            if (!this.final_build)
            {
                this.has_generic_share = true;
                this.main.has_generic_share = true;
            }
            if (AndroidIAB.isSupported())
            {
                if (this.final_build)
                {
                    AndroidIAB.create();
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.SERVICE_READY, this.onIAPReady);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.SERVICE_NOT_SUPPORTED, this.onIAPUnsupported);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.INVENTORY_LOADED, this.onInventoryLoaded);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingErrorEvent.LOAD_INVENTORY_FAILED, this.onInventoryFailed);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_SUCCEEDED, this.onPurchaseSuccess);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingErrorEvent.PURCHASE_FAILED, this.onPurchaseFailed);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.CONSUME_SUCCEEDED, this.onConsumeSuccess);
                    AndroidIAB.androidIAB.addEventListener(AndroidBillingErrorEvent.CONSUME_FAILED, this.onConsumeFailed);
                    AndroidIAB.androidIAB.startBillingService("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA08Bbq6W7x1CwwSWHIJ37d54bhkitucJwTTuor9NTavO9egh/bNyTX3xg1qeRWE2asTFUTxh6oQrpiBNivzT1CR0WMEen4rAbdgXCIeYI34R++LBDnJUIGkisbvrLGF9mGhMMYfRFPLMkvBrIQnLmvsfq5bqntyD/dDwNLsELwI47+/k6ef/0zIHoPe/j5Dg/9xuj/ZRMx86YFZMlqkEcSf1ESWV9XfDw0eAZ3rJI6IiGfoiU1PnqVcVGRgp9HQ/v5y9lodsL1rAkuO+1ABSFCSaZzjT1iEJXQoTDVrFvnihbtIsPDCGaqOBu8mXauXFH8dnQBBF7+y+jGd9c7ziMzwIDAQAB");
                }
            }
            this.main.purchase = function (param1)
            {
                if (param1 == "RemoveAds")
                {
                    AndroidIAB.androidIAB.purchaseItem("remove_ads");
                }
                return;
            }// end function
            ;
            this.iaps_enabled = false;
            this.main.showAd = function ()
            {
                var _loc_1:* = false;
                if (main.final_score > 100)
                {
                    if (has_ads)
                    {
                        if (has_rate_box && !did_rate_prompt)
                        {
                            did_rate_prompt = true;
                            try
                            {
                                so = SharedObject.getLocal("game");
                                if (so)
                                {
                                    if (so.data)
                                    {
                                        so.data.did_rate_prompt = "1";
                                        so.flush();
                                    }
                                }
                            }
                            catch (ee)
                            {
                            }
                            if (main.getSo("dshrb") != "1")
                            {
                                if (!RateBox.rateBox.didRateCurrentVersion())
                                {
                                    main.setSo("dshrb", "1");
                                    RateBox.rateBox.showRatingPrompt("Rate slither.io", "Thank you so much for playing! If you like the game, would you please rate it?");
                                    _loc_1 = true;
                                }
                            }
                        }
                    }
                }
                if (!_loc_1)
                {
                    showAd();
                }
                return;
            }// end function
            ;
            this.main.share = function (param1, param2)
            {
                if (has_viral)
                {
                    if (has_generic_share)
                    {
                        GoViral.goViral.shareGenericMessage(param1, param2, false, 800, 800);
                    }
                }
                return;
            }// end function
            ;
            if (!this.final_build)
            {
                Starling.current.showStatsAt("right", "bottom", 1.75 * (this.main.is_mac ? (1) : (2)));
            }
            return;
        }// end function

    }
}
