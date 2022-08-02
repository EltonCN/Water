using System;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

[Serializable]
public class TransformPositionClip : PlayableAsset, ITimelineClipAsset
{
    public TransformPositionBehaviour template = new TransformPositionBehaviour ();

    public ClipCaps clipCaps
    {
        get { return ClipCaps.Blending; }
    }

    public override Playable CreatePlayable (PlayableGraph graph, GameObject owner)
    {
        var playable = ScriptPlayable<TransformPositionBehaviour>.Create (graph, template);
        return playable;
    }
}
