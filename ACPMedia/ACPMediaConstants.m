/*
Copyright 2021 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import "ACPMediaConstants.h"

#pragma mark Standard Stream Type Constants

NSString* const ACPMediaStreamTypeVod = @"vod";
NSString* const ACPMediaStreamTypeLive = @"live";
NSString* const ACPMediaStreamTypeLinear = @"linear";
NSString* const ACPMediaStreamTypePodcast = @"podcast";
NSString* const ACPMediaStreamTypeAudiobook = @"audiobook";
NSString* const ACPMediaStreamTypeAod = @"aod";

#pragma mark Standard Video Metadata Public Constants

NSString* const ACPVideoMetadataKeyShow = @"a.media.show";
NSString* const ACPVideoMetadataKeySeason = @"a.media.season";
NSString* const ACPVideoMetadataKeyEpisode = @"a.media.episode";
NSString* const ACPVideoMetadataKeyAssetId = @"a.media.asset";
NSString* const ACPVideoMetadataKeyGenre = @"a.media.genre";
NSString* const ACPVideoMetadataKeyFirstAirDate = @"a.media.airDate";
NSString* const ACPVideoMetadataKeyFirstDigitalDate = @"a.media.digitalDate";
NSString* const ACPVideoMetadataKeyRating = @"a.media.rating";
NSString* const ACPVideoMetadataKeyOriginator = @"a.media.originator";
NSString* const ACPVideoMetadataKeyNetwork = @"a.media.network";
NSString* const ACPVideoMetadataKeyShowType = @"a.media.type";
NSString* const ACPVideoMetadataKeyAdLoad = @"a.media.adLoad";
NSString* const ACPVideoMetadataKeyMvpd = @"a.media.pass.mvpd";
NSString* const ACPVideoMetadataKeyAuthorized = @"a.media.pass.auth";
NSString* const ACPVideoMetadataKeyDayPart = @"a.media.dayPart";
NSString* const ACPVideoMetadataKeyFeed = @"a.media.feed";
NSString* const ACPVideoMetadataKeyStreamFormat = @"a.media.format";

#pragma mark Standard Audio Metadata Public Constants

NSString* const ACPAudioMetadataKeyArtist    = @"a.media.artist";
NSString* const ACPAudioMetadataKeyAlbum     = @"a.media.album";
NSString* const ACPAudioMetadataKeyLabel     = @"a.media.label";
NSString* const ACPAudioMetadataKeyAuthor    = @"a.media.author";
NSString* const ACPAudioMetadataKeyStation   = @"a.media.station";
NSString* const ACPAudioMetadataKeyPublisher = @"a.media.publisher";

#pragma mark Standard Ad Metadata Public Constants

NSString* const ACPAdMetadataKeyAdvertiser = @"a.media.ad.advertiser";
NSString* const ACPAdMetadataKeyCampaignId = @"a.media.ad.campaign";
NSString* const ACPAdMetadataKeyCreativeId = @"a.media.ad.creative";
NSString* const ACPAdMetadataKeyPlacementId = @"a.media.ad.placement";
NSString* const ACPAdMetadataKeySiteId = @"a.media.ad.site";
NSString* const ACPAdMetadataKeyCreativeUrl = @"a.media.ad.creativeURL";

#pragma mark Media Public Constants

NSString* const  ACPMediaKeyMediaResumed = @"media.resumed";
NSString* const  ACPMediaKeyPrerollTrackingWaitingTime = @"media.prerollwaitingtime";
NSString* const  ACPMediaKeyGranularAdTracking = @"media.granularadtracking";

#pragma mark Config Public Constants

NSString* const ACPMediaKeyConfigChannel = @"config.channel";
NSString* const ACPMediaKeyConfigDownloadedContent = @"config.downloadedcontent";

#pragma mark Player State Constants

NSString* const ACPMediaPlayerStateFullScreen = @"fullScreen";
NSString* const ACPMediaPlayerStatePictureInPicture = @"pictureInPicture";
NSString* const ACPMediaPlayerStateClosedCaption = @"closedCaptioning";
NSString* const ACPMediaPlayerStateInFocus = @"inFocus";
NSString* const ACPMediaPlayerStateMute = @"mute";

